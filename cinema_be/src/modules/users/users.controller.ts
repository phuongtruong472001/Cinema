import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { AuthData } from 'src/decorators/auth-data.decorator';
import { User } from './schemas/user.schema';
import { UsersService } from './users.service';
import { buildSuccessResponse } from '@utils/api-response-builder.util';
import { JwtAccessTokenGuard } from 'src/guards/jwt-access-token.guard';
import { RegisterDto } from '@modules/auth/dtos/register.dto';

@Controller('users')
@UseGuards(JwtAccessTokenGuard)
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get('me')
  async getMyProfile(@AuthData() user: User) {
    const profile = await this.usersService.getMyProfile(user._id.toString());
    return buildSuccessResponse(profile);
  }

  @Post('create-admin')
  async createAdmin(
    @AuthData() user: User,
    @Body() createAdminData: RegisterDto,
  ) {
    const newAdmin = await this.usersService.createAdmin(createAdminData, user);
    return buildSuccessResponse(newAdmin);
  }
}
