export interface CreateMealDto {
  takenAt: string | Date
  items: { foodId: string; grams: number }[]
}
