import { IsInt, IsMongoId, IsNumber, Min } from 'class-validator';

export class CreateShowtimeDto {
  @IsMongoId()
  movie: string;

  @IsMongoId()
  room: string;

  @IsNumber()
  @Min(0)
  price: number;

  @IsInt()
  @Min(0)
  startTime: number;
}
