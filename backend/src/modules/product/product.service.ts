import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class ProductService {
  constructor(private prisma: PrismaService) {}

  async getAll() {
    return await this.prisma.products.findMany(); // Đổi từ product -> products
  }

  async getById(product_id: number) {
    return await this.prisma.products.findUnique({ where: { product_id } }); // Đổi từ product -> products
  }

  async create(data: Prisma.productsCreateInput) {
    // Đổi từ ProductCreateInput -> productsCreateInput
    try {
      return await this.prisma.products.create({ data }); // Đổi từ product -> products
    } catch (error: unknown) {
      if (error instanceof Error) {
        throw new Error(`Lỗi khi tạo sản phẩm: ${error.message}`);
      }
      throw new Error('Lỗi không xác định khi tạo sản phẩm');
    }
  }

  async update(product_id: number, data: Prisma.productsUpdateInput) {
    // Đổi từ ProductUpdateInput -> productsUpdateInput
    try {
      return await this.prisma.products.update({ where: { product_id }, data }); // Đổi từ product -> products
    } catch (error: unknown) {
      if (error instanceof Error) {
        throw new Error(`Lỗi khi cập nhật sản phẩm: ${error.message}`);
      }
      throw new Error('Lỗi không xác định khi cập nhật sản phẩm');
    }
  }

  async delete(product_id: number) {
    try {
      return await this.prisma.products.delete({ where: { product_id } }); // Đổi từ product -> products
    } catch (error: unknown) {
      if (error instanceof Error) {
        throw new Error(`Lỗi khi xoá sản phẩm: ${error.message}`);
      }
      throw new Error('Lỗi không xác định khi xoá sản phẩm');
    }
  }
  async getBySlug(slug: string) {
    return await this.prisma.products.findFirst({ where: { slug } });
  }
}
