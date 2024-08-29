import {
  IsNotEmpty,
  IsOptional,
  IsPositive,
  IsString,
  MaxLength,
  Min,
} from 'class-validator';

export class UpdateMovieDto {
  @IsOptional()
  @MaxLength(64)
  @IsNotEmpty()
  name?: string;

  @IsOptional()
  @IsPositive()
  @Min(1)
  duration?: number;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsString()
  thumbnail?: string;
}
