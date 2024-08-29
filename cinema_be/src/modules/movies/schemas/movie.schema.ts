import { BaseSchemaSoftDelete } from '@common/base.schema';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { standardizeString } from '@utils/string.util';

@Schema({
  timestamps: {
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  },
  versionKey: false,
  collection: 'movies',
})
export class Movie extends BaseSchemaSoftDelete {
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
    min: 1,
  })
  duration: number;

  @Prop({
    type: String,
  })
  description?: string;

  @Prop({
    type: String,
  })
  thumbnail?: string;
}

export const MovieSchema = SchemaFactory.createForClass(Movie);

MovieSchema.index(
  {
    name: 1,
    deleted_at: 1,
  },
  {
    unique: true,
  },
);
