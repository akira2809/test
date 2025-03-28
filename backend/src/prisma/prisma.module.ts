import { Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Module({
  providers: [PrismaService], // Đảm bảo PrismaService có trong providers
  exports: [PrismaService], // Xuất PrismaService để các module khác có thể dùng
})
export class PrismaModule {}
