import { ApiQueryDto } from '@common/api-query.dto';
import { User } from '@modules/users/schemas/user.schema';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Query,
  UseGuards,
} from '@nestjs/common';
import { buildSuccessResponse } from '@utils/api-response-builder.util';
import { AuthData } from 'src/decorators/auth-data.decorator';
import { JwtAccessTokenGuard } from 'src/guards/jwt-access-token.guard';
import { CreateMovieDto } from './dtos/create-movie.dto';
import { UpdateMovieDto } from './dtos/update-movie.dto';
import { MoviesService } from './movies.service';
import { Public } from 'src/decorators/public-api.decorator';
import { ObjectIdValidationPipe } from '@common/objectid-validation.pipe';

@Controller('movies')
@UseGuards(JwtAccessTokenGuard)
export class MoviesController {
  constructor(private readonly moviesService: MoviesService) {}

  @Get()
  @Public()
  async getAll(@Query() query: ApiQueryDto) {
    const { items, total } = await this.moviesService.getAll(query);
    return buildSuccessResponse({ items, total });
  }

  @Get(':movieId')
  @Public()
  async get(@Param('movieId', new ObjectIdValidationPipe()) movieId: string) {
    const movie = await this.moviesService.get(movieId);
    return buildSuccessResponse(movie);
  }

  @Post()
  async createMovie(
    @AuthData() user: User,
    @Body() createMovieData: CreateMovieDto,
  ) {
    const movie = await this.moviesService.createMovie(user, createMovieData);
    return buildSuccessResponse(movie);
  }

  @Patch(':movieId')
  async updateMovie(
    @AuthData() user: User,
    @Param('movieId', new ObjectIdValidationPipe()) movieId: string,
    @Body() updateMovieData: UpdateMovieDto,
  ) {
    const movie = await this.moviesService.updateMovie(
      user,
      movieId,
      updateMovieData,
    );
    return buildSuccessResponse(movie);
  }

  @Delete(':movieId')
  async deleteMovie(
    @AuthData() user: User,
    @Param('movieId', new ObjectIdValidationPipe()) movieId: string,
  ) {
    await this.moviesService.delete(movieId, user);
    return buildSuccessResponse();
  }
}
