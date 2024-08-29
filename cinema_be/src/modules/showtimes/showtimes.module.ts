import { Module } from '@nestjs/common';
import { ShowtimesController } from './showtimes.controller';
import { ShowtimesService } from './showtimes.service';
import { MongooseModule } from '@nestjs/mongoose';
import { Showtime, ShowtimeSchema } from './schemas/showtime.schema';
import { Room, RoomSchema } from '@modules/room/schemas/room.schema';
import { Movie, MovieSchema } from '@modules/movies/schemas/movie.schema';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Showtime.name, schema: ShowtimeSchema },
      { name: Room.name, schema: RoomSchema },
      { name: Movie.name, schema: MovieSchema },
    ]),
  ],
  controllers: [ShowtimesController],
  providers: [ShowtimesService],
})
export class ShowtimesModule {}
