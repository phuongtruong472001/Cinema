import {
  BadRequestException,
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { RegisterDto } from './dtos/register.dto';
import {
  EUserRole,
  EUserStatus,
  User,
} from '@modules/users/schemas/user.schema';
import { LoginDto } from './dtos/login.dto';
import { verifyPlainContentWithHashedContent } from '@utils/secure.util';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { EmailsService } from '@modules/emails/emails.service';
import { generateRandomString } from '@utils/random-string.util';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class AuthService {
  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
    private readonly emailsService: EmailsService,
    @InjectModel(User.name) private readonly userModel: Model<User>,
  ) {}

  async register(registerData: RegisterDto): Promise<User> {
    // check duplicated email
    const existedUser = await this.userModel.findOne({
      email: registerData.email,
      deleted_at: null,
    });
    if (existedUser) {
      throw new BadRequestException('User existed');
    }

    const verificationCode = generateRandomString(64);
    const verificationCodeExpiresAt =
      Date.now() +
      this.configService.get<number>('ACTIVATE_EMAIL_TOKEN_EXPIRATION_TIME') *
        1000;
    const newUser = await this.userModel.create({
      ...registerData,
      status: EUserStatus.INACTIVE,
      role: EUserRole.USER,
      verificationCode,
      verificationCodeExpiresAt,
    });
    await this.emailsService.sendRegistrationConfirmation(
      newUser,
      verificationCode,
    );
    return { ...newUser.toObject(), password: undefined };
  }

  async login(loginData: LoginDto) {
    const user = await this.userModel
      .findOne({ email: loginData.email, deleted_at: null })
      .select('+password')
      .lean();
    if (
      user &&
      (await verifyPlainContentWithHashedContent(
        loginData.password,
        user.password,
      ))
    ) {
      // token payload
      const payload = this.genTokenPayload(
        user._id.toString(),
        user.status,
        user.role,
      );
      // access token
      const accessToken = this.generateToken(
        payload,
        this.configService.get<string>('ACCESS_TOKEN_SECRET_KEY').toString(),
        this.configService.get<number>('ACCESS_TOKEN_EXPIRATION_TIME'),
      );
      return {
        ...user,
        password: undefined,
        accessToken,
      };
    }
    throw new UnauthorizedException('Wrong credential');
  }

  async activate(userId: string, code: string) {
    const user = await this.userModel
      .findOne({
        _id: userId,
        deletedAt: null,
        status: EUserStatus.INACTIVE,
      })
      .select('+verificationCode +verificationCodeExpiresAt')
      .lean();

    if (!user) {
      throw new NotFoundException('User not found');
    }

    if (code === user.verificationCode) {
      if (user.verificationCodeExpiresAt < Date.now()) {
        throw new BadRequestException('Verification code has expired');
      }

      await this.userModel.updateOne(
        { _id: user._id },
        {
          $set: {
            status: EUserStatus.ACTIVE,
            verificationCode: null,
            verificationCodeExpiresAt: null,
          },
        },
      );
      return true;
    }
    throw new BadRequestException('Invalid verification code');
  }

  private generateToken(
    payload: object,
    privateKey: string,
    expiresIn: number,
  ): string {
    return this.jwtService.sign(payload, {
      privateKey,
      expiresIn: `${expiresIn}s`,
    });
  }

  private genTokenPayload(_id: string, status: EUserStatus, role: EUserRole) {
    return {
      _id,
      status,
      role,
    };
  }
}
