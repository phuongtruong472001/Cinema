import { IsNumber, IsOptional, Min } from 'class-validator';

export class ShowtimeQueryDto {
  @IsOptional()
  @IsNumber()
  @Min(0)
  from?: number;

  @IsOptional()
  @IsNumber()
  @Min(0)
  to?: number;
}
