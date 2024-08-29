import { BaseSchemaSoftDelete } from '@common/base.schema';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

@Schema({
  timestamps: {
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  },
  versionKey: false,
  collection: 'tickets',
})
export class Ticket extends BaseSchemaSoftDelete {
  @Prop({
    required: true,
    type: String,
    ref: 'User',
  })
  user: string;

  @Prop({
    required: true,
    type: String,
    ref: 'Showtime',
  })
  showtime: string;

  @Prop({
    required: true,
    type: String,
  })
  seat: string;
}

export const TicketSchema = SchemaFactory.createForClass(Ticket);

TicketSchema.index(
  {
    user: 1,
    showtime: 1,
    seat: 1,
    deleted_at: 1,
  },
  {
    unique: true,
  },
);
