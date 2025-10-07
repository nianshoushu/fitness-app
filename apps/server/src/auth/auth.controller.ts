import { Body, Controller, Post } from '@nestjs/common'
import { AuthService } from './auth.service'

@Controller('auth')
export class AuthController {
  constructor(private auth: AuthService) {}

  @Post('register')
  register(@Body() dto: { phone: string; password: string }) {
    return this.auth.register(dto.phone, dto.password)
  }

  @Post('login')
  login(@Body() dto: { phone: string; password: string }) {
    return this.auth.login(dto.phone, dto.password)
  }
}
