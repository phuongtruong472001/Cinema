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
import { CreateShowtimeDto } from './dtos/create-showtime.dto';
import { UpdateShowtimeDto } from './dtos/update-showtime.dto';
import { ShowtimesService } from './showtimes.service';
import { Public } from 'src/decorators/public-api.decorator';
import { ObjectIdValidationPipe } from '@common/objectid-validation.pipe';
import { ShowtimeQueryDto } from './dtos/showtime-query.dto';

@Controller('showtimes')
@UseGuards(JwtAccessTokenGuard)
export class ShowtimesController {
  constructor(private readonly showtimesService: ShowtimesService) {}

  @Get()
  @Public()
  async getAll(@Query() query: ApiQueryDto & ShowtimeQueryDto) {
    const { items, total } = await this.showtimesService.getAll(query);
    return buildSuccessResponse({ items, total });
  }

  @Get(':showtimeId')
  @Public()
  async get(
    @Param('showtimeId', new ObjectIdValidationPipe()) showtimeId: string,
  ) {
    const showtime = await this.showtimesService.get(showtimeId);
    return buildSuccessResponse(showtime);
  }

  @Post()
  async createShowtime(
    @AuthData() user: User,
    @Body() createShowtimeData: CreateShowtimeDto,
  ) {
    const showtime = await this.showtimesService.createShowtime(
      user,
      createShowtimeData,
    );
    return buildSuccessResponse(showtime);
  }

  @Patch(':showtimeId')
  async updateShowtime(
    @AuthData() user: User,
    @Param('showtimeId', new ObjectIdValidationPipe()) showtimeId: string,
    @Body() updateShowtimeData: UpdateShowtimeDto,
  ) {
    const showtime = await this.showtimesService.updateShowtime(
      user,
      showtimeId,
      updateShowtimeData,
    );
    return buildSuccessResponse(showtime);
  }

  @Delete(':showtimeId')
  async deleteShowtime(
    @AuthData() user: User,
    @Param('showtimeId', new ObjectIdValidationPipe()) showtimeId: string,
  ) {
    await this.showtimesService.delete(showtimeId, user);
    return buildSuccessResponse();
  }
}
