import { Injectable } from '@nestjs/common'
import { PrismaService } from '../prisma/prisma.service'

@Injectable()
export class StatsService {
  constructor(private prisma: PrismaService) {}

  async today(userId: string) {
    // 当天 00:00:00 ~ 23:59:59
    const start = new Date()
    start.setHours(0, 0, 0, 0)
    const end = new Date()
    end.setHours(23, 59, 59, 999)

    const meals = await this.prisma.meal.findMany({
      where: { userId, takenAt: { gte: start, lte: end } },
      include: { items: { include: { food: true } } },
    })

    let kcal = 0, protein = 0, fat = 0, carbs = 0
    for (const m of meals) {
      for (const it of m.items) {
        const ratio = (it.grams || 0) / 100
        kcal += ratio * (it.food.kcal || 0)
        protein += ratio * (it.food.protein || 0)
        fat += ratio * (it.food.fat || 0)
        carbs += ratio * (it.food.carbs || 0)
      }
    }
    return {
      kcal: Math.round(kcal),
      protein: +protein.toFixed(1),
      fat: +fat.toFixed(1),
      carbs: +carbs.toFixed(1),
      meals: meals.length,
    }
  }
}
