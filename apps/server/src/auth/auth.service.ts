import { Injectable, UnauthorizedException } from '@nestjs/common'
import { PrismaService } from '../prisma/prisma.service'
import { JwtService } from '@nestjs/jwt'
import * as bcrypt from 'bcrypt'

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService, private jwt: JwtService) {}

  async register(phone: string, password: string) {
    const existed = await this.prisma.user.findUnique({ where: { phone } })
    const hash = await bcrypt.hash(password, 10)
    if (existed) {
      // 幂等：已存在就直接返回“可登录”
      return { ok: true, message: 'already registered' }
    }
    await this.prisma.user.create({ data: { phone, password: hash } })
    return { ok: true }
  }

  async login(phone: string, password: string) {
    const user = await this.prisma.user.findUnique({ where: { phone } })
    if (!user) throw new UnauthorizedException('user not found')
    const ok = await bcrypt.compare(password, user.password)
    if (!ok) throw new UnauthorizedException('wrong password')
    const token = await this.jwt.signAsync({ sub: user.id, phone: user.phone })
    return { token }
  }
}
