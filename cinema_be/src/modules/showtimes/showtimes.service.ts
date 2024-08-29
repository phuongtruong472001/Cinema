import {
  BadRequestException,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { FilterQuery, Model } from 'mongoose';
import { Showtime } from './schemas/showtime.schema';
import { EUserRole, User } from '@modules/users/schemas/user.schema';
import { CreateShowtimeDto } from './dtos/create-showtime.dto';
import { ApiQueryDto } from '@common/api-query.dto';
import { MultiItemsResponse } from '@utils/api-response-builder.util';
import { UpdateShowtimeDto } from './dtos/update-showtime.dto';
import { Room } from '@modules/room/schemas/room.schema';
import { Movie } from '@modules/movies/schemas/movie.schema';
import { ShowtimeQueryDto } from './dtos/showtime-query.dto';

@Injectable()
export class ShowtimesService {
  constructor(
    @InjectModel(Showtime.name) private readonly showtimeModel: Model<Showtime>,
    @InjectModel(Room.name) private readonly roomModel: Model<Room>,
    @InjectModel(Movie.name) private readonly movieModel: Model<Movie>,
  ) {}

  async getAll(
    query: ApiQueryDto & ShowtimeQueryDto,
  ): Promise<MultiItemsResponse<Showtime>> {
    // build filter query
    const filter: FilterQuery<Showtime> = {
      deleted_at: null,
      ...((query.from || query.to) && {
        startTime: {
          ...(query.from && { $gte: query.from }),
          ...(query.to && { $lte: query.to }),
        },
      }),
    };
    // build get showtimes query
    const itemsQuery = this.showtimeModel.find(filter);
    query?.page && itemsQuery.skip((query.page - 1) * query.limit);
    query?.limit && itemsQuery.limit(query.limit);
    query?.sortBy && itemsQuery.sort(query.sortBy);
    query?.fields && itemsQuery.select(query.fields);
    itemsQuery.lean();

    // build get total of project query
    const totalQuery = this.showtimeModel.countDocuments(filter);

    const [items, total] = await Promise.all([itemsQuery, totalQuery]);
    return { items, total };
  }

  async get(showtimeId: string) {
    // find showtime
    const showtime = await this.showtimeModel.findOne({
      _id: showtimeId,
      deleted_at: null,
    });
    // throw error if not found
    if (!showtime) {
      throw new BadRequestException('Showtime not found');
    }
    return showtime;
  }

  async createShowtime(user: User, createShowtimeData: CreateShowtimeDto) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // check room
    const roomExisted = await this.roomModel.exists({
      _id: createShowtimeData.room,
      deleted_at: null,
    });
    if (!roomExisted) {
      throw new BadRequestException('Room not found');
    }
    // check movie
    const movieExisted = await this.movieModel.exists({
      _id: createShowtimeData.movie,
      deleted_at: null,
    });
    if (!movieExisted) {
      throw new BadRequestException('Movie not found');
    }

    // create new showtime
    const showtime = await this.showtimeModel.create({
      movie: createShowtimeData.movie,
      room: createShowtimeData.room,
      price: createShowtimeData.price,
      startTime: createShowtimeData.startTime,
    });
    return showtime;
  }

  async updateShowtime(
    user: User,
    showtimeId: string,
    updateShowtimeData: UpdateShowtimeDto,
  ) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // get showtime
    const showtime = await this.showtimeModel.findOne({
      _id: showtimeId,
      deleted_at: null,
    });

    // set new data
    updateShowtimeData.room && (showtime.room = updateShowtimeData.room);
    updateShowtimeData.movie && (showtime.movie = updateShowtimeData.movie);
    updateShowtimeData.price && (showtime.price = updateShowtimeData.price);
    updateShowtimeData.startTime &&
      (showtime.startTime = updateShowtimeData.startTime);
    await showtime.save({ validateBeforeSave: true });

    return showtime;
  }

  async delete(showtimeId: string, user: User) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // find showtime
    const showtime = await this.showtimeModel.findOne({
      _id: showtimeId,
      deleted_at: null,
    });
    if (!showtime) {
      throw new BadRequestException('Showtime not found');
    }

    // softdelete showtime
    showtime.deleted_at = new Date();
    await showtime.save();
  }
}
