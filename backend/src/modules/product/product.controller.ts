import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { ProductService } from './product.service';
import { Prisma } from '@prisma/client';

@Controller('product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  // 📌 Lấy danh sách tất cả sản phẩm
  @Get()
  async getAll() {
    return await this.productService.getAll();
  }

  // 📌 Lấy chi tiết một sản phẩm theo ID
  @Get(':id')
  async getById(@Param('id') product_id: string) {
    return await this.productService.getById(Number(product_id));
  }
  @Get('slug/:slug')
  async getBySlug(@Param('slug') slug: string) {
    return await this.productService.getBySlug(slug);
  }

  // 📌 Tạo một sản phẩm mới
  @Post()
  async create(@Body() data: Prisma.productsCreateInput) {
    return await this.productService.create(data);
  }

  // 📌 Cập nhật sản phẩm theo ID
  @Put(':id')
  async update(
    @Param('id') product_id: string,
    @Body() data: Prisma.productsUpdateInput,
  ) {
    return await this.productService.update(Number(product_id), data);
  }

  // 📌 Xóa sản phẩm theo ID
  @Delete(':id')
  async delete(@Param('id') product_id: string) {
    return await this.productService.delete(Number(product_id));
  }
}
