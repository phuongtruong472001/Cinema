import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Ticket } from './schemas/ticket.schema';
import { Model } from 'mongoose';
import { CreateTicketDto } from './dtos/create-ticket.dto';
import { Showtime } from '@modules/showtimes/schemas/showtime.schema';
import { Room } from '@modules/room/schemas/room.schema';
import { User } from '@modules/users/schemas/user.schema';

@Injectable()
export class TicketsService {
  constructor(
    @InjectModel(Ticket.name) private readonly ticketsModel: Model<Ticket>,
    @InjectModel(Showtime.name)
    private readonly showtimesModel: Model<Showtime>,
  ) {}

  async create(user: User, createTicketData: CreateTicketDto) {
    // check showtime
    const showtime = await this.showtimesModel
      .findOne({
        _id: createTicketData.showtime,
        deleted_at: null,
      })
      .populate({
        path: 'room',
        match: { deleted_at: null },
      })
      .lean();
    if (!showtime) {
      throw new BadRequestException('Showtime not found');
    }

    // get tickets in showtime
    const currentTickets = await this.ticketsModel
      .find({
        deleted_at: null,
        showtime: createTicketData.showtime,
      })
      .lean();

    const availableSeats = new Set<string>();
    // add all seat to Set
    (showtime.room as Room).seats.forEach((r: Array<string | null>) => {
      r.forEach((seat) => {
        if (seat) {
          availableSeats.add(seat);
        }
      });
    });
    // remove unavailable seat
    currentTickets.forEach((ticket) => {
      if (availableSeats.has(ticket.seat)) {
        availableSeats.delete(ticket.seat);
      }
    });

    // validate tickets are going to buy
    const messages = [];
    createTicketData.seats.forEach((seat) => {
      if (!availableSeats.has(seat)) {
        messages.push(`Seat ${seat} is unavailable`);
      }
    });
    if (messages.length > 0) {
      throw new BadRequestException(messages);
    }

    // create tickets
    const tickets = await this.ticketsModel.insertMany(
      createTicketData.seats.map((seat) => ({
        showtime: createTicketData.showtime,
        user: user._id,
        seat,
      })),
    );

    return tickets;
  }

  async getMyTickets(user: User) {
    const tickets = await this.ticketsModel
      .find({
        user: user._id,
        deleted_at: null,
      })
      .populate({
        path: 'showtime',
        match: { deleted_at: null },
        populate: [
          { path: 'room', match: { deleted_at: null } },
          { path: 'movie', match: { deleted_at: null } },
        ],
      })
      .sort('-showtime.startTime')
      .lean();
    return tickets;
  }
}
