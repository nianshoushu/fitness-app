import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common'
import { JwtAuthGuard } from '../auth/jwt-auth.guard'
import { MealsService } from './meals.service'
import type { CreateMealDto } from './dto'

@Controller('meals')
export class MealsController {
  constructor(private meals: MealsService) {}

  @UseGuards(JwtAuthGuard)
  @Post()
  create(@Req() req: any, @Body() dto: CreateMealDto) {
    return this.meals.create(req.user.userId, dto)
  }
}
