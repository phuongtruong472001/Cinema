import {
  IsArray,
  IsNotEmpty,
  IsOptional,
  IsPositive,
  MaxLength,
  Min,
} from 'class-validator';

export class UpdateRoomDto {
  @MaxLength(64)
  @IsNotEmpty()
  @IsOptional()
  name?: string;

  @IsPositive()
  @Min(1)
  @IsOptional()
  capacity?: number;

  @IsOptional()
  @IsArray()
  @IsArray({ each: true })
  seats?: Array<Array<string | null>>;
}
