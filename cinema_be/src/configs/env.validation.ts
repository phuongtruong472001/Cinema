import * as Joi from 'joi';

const validationSchema = Joi.object({
  PORT: Joi.number().required(),

  MONGODB_HOST: Joi.string().required(),
  MONGODB_PORT: Joi.number().required(),
  MONGODB_USER: Joi.string().required(),
  MONGODB_PASSWORD: Joi.string().required(),
  MONGODB_DBNAME: Joi.string().required(),
  MONGODB_CONNECTION_STRING: Joi.string().required(),

  ACCESS_TOKEN_EXPIRATION_TIME: Joi.number().required(),
  ACCESS_TOKEN_SECRET_KEY: Joi.number().required(),
  ACTIVATE_EMAIL_TOKEN_EXPIRATION_TIME: Joi.number().required(),

  SMTP_HOST: Joi.string().required(),
  SMTP_PORT: Joi.number().required(),
  SMTP_USER: Joi.string().email().required(),
  SMTP_PASS: Joi.string().required(),
});

export default validationSchema;
