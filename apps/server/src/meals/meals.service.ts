import { Injectable } from '@nestjs/common'
import { PrismaService } from '../prisma/prisma.service'
import { CreateMealDto } from './dto'

@Injectable()
export class MealsService {
  constructor(private prisma: PrismaService) {}

  async create(userId: string, dto: CreateMealDto) {
    return this.prisma.meal.create({
      data: {
        userId,
        takenAt: new Date(dto.takenAt),
        items: {
          create: dto.items.map(i => ({
            foodId: i.foodId,
            grams: i.grams,
          })),
        },
      },
      include: { items: true },
    })
  }
}
