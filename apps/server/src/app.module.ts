import { Module } from '@nestjs/common'
import { ConfigModule } from '@nestjs/config'
import { ThrottlerModule } from '@nestjs/throttler'
import { PrismaService } from './prisma/prisma.service'
import { HealthController } from './health.controller'
import { AuthModule } from './auth/auth.module'
import { UserModule } from './user/user.module'
import { MealsModule } from './meals/meals.module'
import { StatsModule } from './stats/stats.module'

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    ThrottlerModule.forRoot([{ ttl: 60_000, limit: 100 }]),
    AuthModule,
    UserModule,
    MealsModule,
    StatsModule,
  ],
  controllers: [HealthController],
  providers: [PrismaService],
})
export class AppModule {}
