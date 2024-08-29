import { User } from '@modules/users/schemas/user.schema';
import { MailerService } from '@nestjs-modules/mailer';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class EmailsService {
  constructor(
    private readonly mailerService: MailerService,
    private readonly configService: ConfigService,
  ) {}

  async sendRegistrationConfirmation(user: User, verificationCode: string) {
    const domain = this.configService.get<string>('APP_DOMAIN');
    await this.mailerService.sendMail({
      to: user.email,
      subject: 'Verify your email address',
      text: `Follow the link to verify your email: http://${domain}/auth/activate?uid=${user._id}&code=${verificationCode}`,
    });
    console.log(
      `Confirmation email was sent to ${user.email} ${verificationCode}`,
    );
  }
}
