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
import { RoomService } from './room.service';
import { JwtAccessTokenGuard } from 'src/guards/jwt-access-token.guard';
import { AuthData } from 'src/decorators/auth-data.decorator';
import { User } from '@modules/users/schemas/user.schema';
import { CreateRoomDto } from './dtos/create-room.dto';
import { buildSuccessResponse } from '@utils/api-response-builder.util';
import { UpdateRoomDto } from './dtos/update-room.dto';
import { ApiQueryDto } from '@common/api-query.dto';
import { Public } from 'src/decorators/public-api.decorator';
import { ObjectIdValidationPipe } from '@common/objectid-validation.pipe';

@Controller('room')
@UseGuards(JwtAccessTokenGuard)
export class RoomController {
  constructor(private readonly roomService: RoomService) {}

  @Get()
  @Public()
  async getAll(@Query() query: ApiQueryDto) {
    const { items, total } = await this.roomService.getAll(query);
    return buildSuccessResponse({ items, total });
  }

  @Get(':roomId')
  @Public()
  async get(@Param('roomId', new ObjectIdValidationPipe()) roomId: string) {
    const room = await this.roomService.get(roomId);
    return buildSuccessResponse(room);
  }

  @Post()
  async createRoom(
    @AuthData() user: User,
    @Body() createRoomData: CreateRoomDto,
  ) {
    const room = await this.roomService.createRoom(user, createRoomData);
    return buildSuccessResponse(room);
  }

  @Patch(':roomId')
  async updateRoom(
    @AuthData() user: User,
    @Param('roomId', new ObjectIdValidationPipe()) roomId: string,
    @Body() updateRoomData: UpdateRoomDto,
  ) {
    const room = await this.roomService.updateRoom(
      user,
      roomId,
      updateRoomData,
    );
    return buildSuccessResponse(room);
  }

  @Delete(':roomId')
  async deleteRoom(
    @AuthData() user: User,
    @Param('roomId', new ObjectIdValidationPipe()) roomId: string,
  ) {
    await this.roomService.delete(roomId, user);
    return buildSuccessResponse();
  }
}
