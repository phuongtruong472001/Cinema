import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { Request } from 'express';
import { ExtractJwt, Strategy } from 'passport-jwt';

@Injectable()
export class JwtAccessTokenStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly configService: ConfigService) {
    super({
      // get token from request
      jwtFromRequest: ExtractJwt.fromExtractors([
        // find in cookies
        JwtAccessTokenStrategy.extractJwtFromCookies,
        // find in header
        ExtractJwt.fromAuthHeaderAsBearerToken(),
      ]),
      ignoreExpiration: false,
      secretOrKey: configService
        .get<string>('ACCESS_TOKEN_SECRET_KEY')
        .toString(),
    });
  }

  // user will be added to request.user
  async validate(payload: any) {
    return payload;
  }

  private static extractJwtFromCookies(req: Request): string | null {
    if (req.cookies && req.cookies['accessToken']) {
      return req.cookies['accessToken'];
    }
    return null;
  }
}
