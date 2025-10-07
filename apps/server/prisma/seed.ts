import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const foods = [
  { name: '米饭', kcal: 116, protein: 2.6, fat: 0.3, carbs: 25.9 },
  { name: '鸡胸肉', kcal: 133, protein: 24.0, fat: 3.1, carbs: 0 },
  { name: '鸡蛋', kcal: 144, protein: 12.7, fat: 10.0, carbs: 1.3 },
  { name: '燕麦片', kcal: 371, protein: 13.7, fat: 7.0, carbs: 62.0 },
  { name: '苹果', kcal: 53, protein: 0.2, fat: 0.2, carbs: 13.5 },
]

async function main() {
  for (const f of foods) {
    await prisma.food.upsert({
      where: { name: f.name },
      create: f as any,
      update: f as any,
    })
  }
  console.log('seed done')
}

main().finally(() => prisma.$disconnect())
