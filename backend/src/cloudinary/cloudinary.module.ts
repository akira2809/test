import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { CloudinaryProvider } from './cloudinary.prodvider';
import { CloudinaryService } from './cloudinary.service';

@Module({
  imports: [ConfigModule], // Thêm dòng này để sử dụng ConfigService
  providers: [CloudinaryProvider, CloudinaryService],
  exports: [CloudinaryService],
})
export class CloudinaryModule {}
