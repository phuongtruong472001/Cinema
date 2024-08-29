import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { NextFunction } from 'express';
import * as bcrypt from 'bcrypt';
import { BaseSchemaSoftDelete } from '@common/base.schema';
import { EMAIL_REGEX } from '@constants/regex.const';
import { standardizeString } from '@utils/string.util';

export enum EUserStatus {
  INACTIVE = 1,
  ACTIVE = 2,
}

export enum EUserRole {
  USER = 1,
  ADMIN = 2,
}

@Schema({
  timestamps: {
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  },
  versionKey: false,
  collection: 'users',
})
export class User extends BaseSchemaSoftDelete {
  @Prop({
    maxlength: 64,
    set: (name: string) => {
      return standardizeString(name);
    },
    required: true,
  })
  name: string;

  @Prop({
    match: EMAIL_REGEX,
    required: true,
  })
  email: string;

  @Prop({
    required: true,
    select: false,
  })
  password: string;

  @Prop({
    required: true,
    type: Number,
    enum: EUserStatus,
    default: EUserStatus.INACTIVE,
  })
  status: EUserStatus;

  @Prop({
    required: true,
    default: EUserRole.USER,
    type: Number,
    enum: EUserRole,
  })
  role: EUserRole;

  @Prop({
    type: String,
    select: false,
  })
  verificationCode?: string;

  @Prop({
    type: Number,
    select: false,
  })
  verificationCodeExpiresAt?: number;
}

export const UserSchema = SchemaFactory.createForClass(User);

UserSchema.index(
  {
    email: 1,
    deleted_at: 1,
  },
  {
    unique: true,
  },
);

export const UserSchemaFactory = () => {
  const user_schema = UserSchema;

  user_schema.pre('save', async function (next: NextFunction) {
    // encode password
    if (this.isModified('password')) {
      const salt = await bcrypt.genSalt(10);
      const hashPassword = await bcrypt.hash(this.password, salt);
      this.password = hashPassword;
    }
    return next();
  });

  return user_schema;
};
