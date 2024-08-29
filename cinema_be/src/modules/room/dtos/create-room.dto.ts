import {
  IsArray,
  IsNotEmpty,
  IsPositive,
  MaxLength,
  Min,
} from 'class-validator';

export class CreateRoomDto {
  @MaxLength(64)
  @IsNotEmpty()
  name: string;

  @IsPositive()
  @Min(1)
  capacity: number;

  @IsArray()
  @IsArray({ each: true })
  seats: Array<Array<string | null>>;
}
