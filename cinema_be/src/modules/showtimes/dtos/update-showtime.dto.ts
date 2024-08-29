import { IsInt, IsMongoId, IsNumber, IsOptional, Min } from 'class-validator';

export class UpdateShowtimeDto {
  @IsMongoId()
  @IsOptional()
  movie?: string;

  @IsMongoId()
  @IsOptional()
  room?: string;

  @IsNumber()
  @Min(0)
  @IsOptional()
  price?: number;

  @IsInt()
  @Min(0)
  @IsOptional()
  startTime?: number;
}
