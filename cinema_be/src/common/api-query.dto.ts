import { Transform, Type } from 'class-transformer';
import {
  IsBoolean,
  IsInt,
  IsOptional,
  IsString,
  Max,
  Min,
  NotContains,
} from 'class-validator';

export class ApiQueryDto {
  @Min(1)
  @IsInt()
  @Type(() => Number)
  @IsOptional()
  page?: number = 1;

  @Max(1000)
  @Min(1)
  @IsInt()
  @Type(() => Number)
  @IsOptional()
  limit?: number = 20;

  @IsString()
  @IsOptional()
  sortBy?: string;

  @NotContains('-', { message: 'Only allow inclusion select' })
  @IsString()
  @IsOptional()
  fields?: string;

  @IsString()
  @IsOptional()
  q?: string;

  @IsBoolean()
  @Transform(({ value }) => {
    return value === 'true' || value === true;
  })
  @IsOptional()
  detail?: boolean;

  @IsString()
  @IsOptional()
  projectId?: string;
}
