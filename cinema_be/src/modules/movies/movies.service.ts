import {
  BadRequestException,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { FilterQuery, Model } from 'mongoose';
import { Movie } from './schemas/movie.schema';
import { EUserRole, User } from '@modules/users/schemas/user.schema';
import { CreateMovieDto } from './dtos/create-movie.dto';
import { ApiQueryDto } from '@common/api-query.dto';
import { MultiItemsResponse } from '@utils/api-response-builder.util';
import { UpdateMovieDto } from './dtos/update-movie.dto';

@Injectable()
export class MoviesService {
  constructor(
    @InjectModel(Movie.name) private readonly movieModel: Model<Movie>,
  ) {}

  async getAll(query: ApiQueryDto): Promise<MultiItemsResponse<Movie>> {
    // build filter query
    const filter: FilterQuery<Movie> = { deleted_at: null };
    query?.q &&
      Object.assign(filter, { name: { $regex: query.q, $options: 'i' } });
    // build get movies query
    const itemsQuery = this.movieModel.find(filter);
    query?.page && itemsQuery.skip((query.page - 1) * query.limit);
    query?.limit && itemsQuery.limit(query.limit);
    query?.sortBy && itemsQuery.sort(query.sortBy);
    query?.fields && itemsQuery.select(query.fields);
    itemsQuery.lean();

    // build get total of project query
    const totalQuery = this.movieModel.countDocuments(filter);

    const [items, total] = await Promise.all([itemsQuery, totalQuery]);
    return { items, total };
  }

  async get(movieId: string) {
    // find movie
    const movie = await this.movieModel.findOne({
      _id: movieId,
      deleted_at: null,
    });
    // throw error if not found
    if (!movie) {
      throw new BadRequestException('Movie not found');
    }
    return movie;
  }

  async createMovie(user: User, createMovieData: CreateMovieDto) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // check movie exists
    const existedMovie = await this.movieModel.exists({
      name: createMovieData.name,
      deleted_at: null,
    });
    if (existedMovie) {
      throw new BadRequestException('Movie existed');
    }

    // create new movie
    const movie = await this.movieModel.create({
      name: createMovieData.name,
      duration: createMovieData.duration,
      description: createMovieData.description,
      thumbnail: createMovieData.thumbnail,
    });
    return movie;
  }

  async updateMovie(
    user: User,
    movieId: string,
    updateMovieData: UpdateMovieDto,
  ) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // get movie
    const movie = await this.movieModel.findOne({
      _id: movieId,
      deleted_at: null,
    });

    // check duplicate movie name
    if (updateMovieData.name && updateMovieData.name !== movie.name) {
      const duplicatedMovie = await this.movieModel.exists({
        _id: { $ne: movieId },
        name: updateMovieData.name,
      });
      if (duplicatedMovie) {
        throw new BadRequestException('Movie existed');
      }
    }

    // set new data
    updateMovieData.name && (movie.name = updateMovieData.name);
    updateMovieData.duration && (movie.duration = updateMovieData.duration);
    updateMovieData.description &&
      (movie.description = updateMovieData.description);
    updateMovieData.thumbnail && (movie.thumbnail = updateMovieData.thumbnail);
    await movie.save({ validateBeforeSave: true });

    return movie;
  }

  async delete(movieId: string, user: User) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // find movie
    const movie = await this.movieModel.findOne({
      _id: movieId,
      deleted_at: null,
    });
    if (!movie) {
      throw new BadRequestException('Movie not found');
    }

    // softdelete movie
    movie.deleted_at = new Date();
    await movie.save();
  }
}
