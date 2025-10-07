import { Controller, Get, Req, UseGuards } from '@nestjs/common'
import { JwtAuthGuard } from '../auth/jwt-auth.guard'
import { StatsService } from './stats.service'

@Controller('stats')
export class StatsController {
  constructor(private stats: StatsService) {}

  @UseGuards(JwtAuthGuard)
  @Get('today')
  today(@Req() req: any) {
    return this.stats.today(req.user.userId)
  }
}
