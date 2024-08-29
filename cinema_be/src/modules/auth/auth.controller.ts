import { Body, Controller, Get, Post, Query, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dtos/register.dto';
import {
  ApiResponse,
  buildSuccessResponse,
} from '@utils/api-response-builder.util';
import { User } from '@modules/users/schemas/user.schema';
import { LoginDto } from './dtos/login.dto';
import { Response } from 'express';
import { ConfigService } from '@nestjs/config';
import { ActivateQueryDto } from './dtos/activate-query.dto';

@Controller('auth')
export class AuthController {
  constructor(
    private readonly authService: AuthService,
    private readonly configService: ConfigService,
  ) {}

  /**
   * User registration api
   */
  @Post('register')
  async register(
    @Body() registerData: RegisterDto,
  ): Promise<ApiResponse<User>> {
    const newUser = await this.authService.register(registerData);
    return buildSuccessResponse(newUser);
  }

  @Post('login')
  async login(
    @Body() loginData: LoginDto,
    @Res({ passthrough: true }) response: Response,
  ) {
    const res = await this.authService.login(loginData);

    // set access token to cookie
    response.cookie('accessToken', res.accessToken, {
      httpOnly: true,
      sameSite: 'strict',
      path: '/',
      maxAge:
        this.configService.get<number>('ACCESS_TOKEN_EXPIRATION_TIME') * 1000,
      domain: this.configService.get<string>('APP_DOMAIN').split(':')[0],
    });

    return buildSuccessResponse(res);
  }

  @Get('activate')
  async activate(@Query() query: ActivateQueryDto) {
    await this.authService.activate(query.uid, query.code);

    return buildSuccessResponse();
  }
}
