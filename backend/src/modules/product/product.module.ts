import { Module } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductController } from './product.controller';
import { PrismaModule } from 'src/prisma/prisma.module'; // Import PrismaModule

@Module({
  imports: [PrismaModule], // Đảm bảo PrismaModule được import vào
  controllers: [ProductController],
  providers: [ProductService],
})
export class ProductModule {}
