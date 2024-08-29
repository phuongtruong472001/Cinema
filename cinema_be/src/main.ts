import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { ValidationPipe } from '@nestjs/common';
import { GlobalExceptionFilter } from '@filters/global-exception.filter';
import * as cookieParser from 'cookie-parser';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const configService = app.get(ConfigService);

  // global validation pipe
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
    }),
  );

  // global exception filter
  app.useGlobalFilters(new GlobalExceptionFilter());

  // cookie parser
  app.use(cookieParser());

  // enable CORS
  const corsOrigins: string[] = JSON.parse(
    (await configService.get('CORS_ALLOWED_LIST')) || '[]',
  );
  app.enableCors({
    origin: corsOrigins,
    credentials: true,
  });

  await app.listen(await configService.get<number>('PORT'));
}
bootstrap();
