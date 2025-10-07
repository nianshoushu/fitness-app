import { NestFactory } from '@nestjs/core'
import { AppModule } from './app.module'

async function bootstrap() {
  const app = await NestFactory.create(AppModule)
  app.enableCors() // 重要：给前端联调用
  await app.listen(3000)
  console.log(`API on http://localhost:3000`)
}
bootstrap()
