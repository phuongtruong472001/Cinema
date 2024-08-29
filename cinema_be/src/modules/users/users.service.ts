import {
  BadRequestException,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { EUserRole, EUserStatus, User } from './schemas/user.schema';
import { Model } from 'mongoose';
import { Timeout } from '@nestjs/schedule';
import { generateRandomString } from '@utils/random-string.util';
import { ConfigService } from '@nestjs/config';
import { RegisterDto } from '@modules/auth/dtos/register.dto';
import { EmailsService } from '@modules/emails/emails.service';

@Injectable()
export class UsersService {
  constructor(
    @InjectModel(User.name) private readonly userModel: Model<User>,
    private readonly configService: ConfigService,
    private readonly emailsService: EmailsService,
  ) {}

  /**
   * The task runs every time the server starts
   * to create a default admin user
   */
  @Timeout(30 * 1000) // delay 30 seconds
  async initDefaultUser() {
    const existedAdmin = await this.userModel.exists({
      email: 'admin@cinema.com',
    });
    if (!existedAdmin) {
      const createdUser = await this.userModel.create({
        email: `admin@cinema.com`,
        password: '12345678',
        name: 'admin',
        role: EUserRole.ADMIN,
        status: EUserStatus.ACTIVE,
      });
      if (createdUser) {
        console.log(
          '\x1b[36m%s\x1b[0m', // cyan color
          `Admin initialization successful email:'admin@cinema.com' password:'12345678'`,
        );
      }
    }
  }

  async getMyProfile(userId: string) {
    const myProfile = await this.userModel.findOne({
      _id: userId,
      deleted_at: null,
    });
    if (!myProfile) {
      throw new BadRequestException('User not found');
    }
    return myProfile;
  }

  async createAdmin(createAdminData: RegisterDto, creator: User) {
    if (creator.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }
    // check duplicated email
    const existedUser = await this.userModel.findOne({
      email: createAdminData.email,
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
      ...createAdminData,
      status: EUserStatus.INACTIVE,
      role: EUserRole.ADMIN,
      verificationCode,
      verificationCodeExpiresAt,
    });
    await this.emailsService.sendRegistrationConfirmation(
      newUser,
      verificationCode,
    );
    return {
      ...newUser,
      password: undefined,
    };
  }
}
