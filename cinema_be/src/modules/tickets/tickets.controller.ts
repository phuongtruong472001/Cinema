import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { TicketsService } from './tickets.service';
import { AuthData } from 'src/decorators/auth-data.decorator';
import { CreateTicketDto } from './dtos/create-ticket.dto';
import { buildSuccessResponse } from '@utils/api-response-builder.util';
import { User } from '@modules/users/schemas/user.schema';
import { JwtAccessTokenGuard } from 'src/guards/jwt-access-token.guard';

@Controller('tickets')
@UseGuards(JwtAccessTokenGuard)
export class TicketsController {
  constructor(private readonly ticketsService: TicketsService) {}

  @Post()
  async createTickets(
    @AuthData() user: User,
    @Body() createTicketData: CreateTicketDto,
  ) {
    const tickets = await this.ticketsService.create(user, createTicketData);

    return buildSuccessResponse(tickets);
  }

  @Get()
  async getMyTickets(@AuthData() user: User) {
    const tickets = await this.ticketsService.getMyTickets(user);
    return buildSuccessResponse(tickets);
  }
}
