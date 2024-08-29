import {
  BadRequestException,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { FilterQuery, Model } from 'mongoose';
import { Room } from './schemas/room.schema';
import { CreateRoomDto } from './dtos/create-room.dto';
import { EUserRole, User } from '@modules/users/schemas/user.schema';
import { UpdateRoomDto } from './dtos/update-room.dto';
import { ApiQueryDto } from '@common/api-query.dto';
import { MultiItemsResponse } from '@utils/api-response-builder.util';
import { Showtime } from '@modules/showtimes/schemas/showtime.schema';

@Injectable()
export class RoomService {
  constructor(
    @InjectModel(Room.name) private readonly roomModel: Model<Room>,
    @InjectModel(Showtime.name) private readonly showtimeModel: Model<Showtime>,
  ) {}

  async getAll(query: ApiQueryDto): Promise<MultiItemsResponse<Room>> {
    // build filter query
    const filter: FilterQuery<Room> = { deleted_at: null };
    query?.q &&
      Object.assign(filter, { name: { $regex: query.q, $options: 'i' } });
    // build get rooms query
    const itemsQuery = this.roomModel.find(filter);
    query?.page && itemsQuery.skip((query.page - 1) * query.limit);
    query?.limit && itemsQuery.limit(query.limit);
    query?.sortBy && itemsQuery.sort(query.sortBy);
    query?.fields && itemsQuery.select(query.fields);
    itemsQuery.lean();

    // build get total of project query
    const totalQuery = this.roomModel.countDocuments(filter);

    const [items, total] = await Promise.all([itemsQuery, totalQuery]);
    return { items, total };
  }

  async get(roomId: string) {
    // find room
    const room = await this.roomModel.findOne({
      _id: roomId,
      deleted_at: null,
    });
    // throw error if not found
    if (!room) {
      throw new BadRequestException('Room not found');
    }
    return room;
  }

  async createRoom(user: User, createRoomData: CreateRoomDto) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // check room exists
    const existedRoom = await this.roomModel.exists({
      name: createRoomData.name,
      deleted_at: null,
    });
    if (existedRoom) {
      throw new BadRequestException('Room existed');
    }

    // create new room
    const room = await this.roomModel.create({
      name: createRoomData.name,
      capacity: createRoomData.capacity,
      seats: createRoomData.seats,
    });
    return room;
  }

  async updateRoom(user: User, roomId: string, updateRoomData: UpdateRoomDto) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // get room
    const room = await this.roomModel.findOne({
      _id: roomId,
      deleted_at: null,
    });

    // check duplicate room name
    if (updateRoomData.name && updateRoomData.name !== room.name) {
      const duplicatedRoom = await this.roomModel.exists({
        _id: { $ne: roomId },
        name: updateRoomData.name,
      });
      if (duplicatedRoom) {
        throw new BadRequestException('Room existed');
      }
    }

    // set new data
    updateRoomData.name && (room.name = updateRoomData.name);
    updateRoomData.capacity && (room.capacity = updateRoomData.capacity);
    updateRoomData.seats && (room.seats = updateRoomData.seats);
    await room.save({ validateBeforeSave: true });

    return room;
  }

  async delete(roomId: string, user: User) {
    // check permission
    if (user.role !== EUserRole.ADMIN) {
      throw new ForbiddenException();
    }

    // find room
    const room = await this.roomModel.findOne({
      _id: roomId,
      deleted_at: null,
    });
    if (!room) {
      throw new BadRequestException('Room not found');
    }

    // delete room
    room.deleted_at = new Date();
    await room.save();

    // delete showtimes
    await this.showtimeModel.updateMany(
      {
        room: roomId,
        deleted_at: null,
      },
      {
        $set: {
          deleted_at: new Date(),
        },
      },
    );
  }
}
