import { BaseSchemaSoftDelete } from '@common/base.schema';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { standardizeString } from '@utils/string.util';

@Schema({
  timestamps: {
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  },
  versionKey: false,
  collection: 'rooms',
})
export class Room extends BaseSchemaSoftDelete {
  @Prop({
    maxlength: 64,
    set: (name: string) => {
      return standardizeString(name);
    },
    required: true,
  })
  name: string;

  @Prop({
    required: true,
    type: Number,
  })
  capacity: number;

  @Prop({
    required: true,
    type: Array<Array<string | null>>,
  })
  seats: Array<Array<string | null>>;
}

export const RoomSchema = SchemaFactory.createForClass(Room);

RoomSchema.index(
  {
    name: 1,
    deleted_at: 1,
  },
  {
    unique: true,
  },
);
