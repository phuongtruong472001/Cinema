import { BaseSchemaSoftDelete } from '@common/base.schema';
import { Room } from '@modules/room/schemas/room.schema';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

@Schema({
  timestamps: {
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  },
  versionKey: false,
  collection: 'showtimes',
})
export class Showtime extends BaseSchemaSoftDelete {
  @Prop({
    required: true,
    type: String,
    ref: 'Movie',
  })
  movie: string;

  @Prop({
    required: true,
    type: String,
    ref: 'Room',
  })
  room: string | Room;

  @Prop({
    required: true,
    type: Number,
  })
  price: number;

  @Prop({
    required: true,
    type: Number,
  })
  startTime: number;
}

export const ShowtimeSchema = SchemaFactory.createForClass(Showtime);
