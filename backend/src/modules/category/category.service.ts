import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class CategoryService {
  constructor(private prisma: PrismaService) {}

  async getAll() {
    return await this.prisma.categories.findMany();
  }

  async getById(category_id: number) {
    return await this.prisma.categories.findUnique({ where: { category_id } });
  }

  async create(data: Prisma.categoriesCreateInput) {
    try {
      return await this.prisma.categories.create({ data });
    } catch (error) {
      // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
      throw new Error(`Lỗi khi tạo category: ${error.message}`);
    }
  }

  async update(category_id: number, data: Prisma.categoriesUpdateInput) {
    try {
      return await this.prisma.categories.update({
        where: { category_id },
        data,
      });
    } catch (error: unknown) {
      throw new Error(
        `Lỗi khi cập nhật category: ${error instanceof Error ? error.message : 'Lỗi không xác định'}`,
      );
    }
  }

  async delete(category_id: number) {
    try {
      return await this.prisma.categories.delete({ where: { category_id } });
    } catch (error: unknown) {
      throw new Error(
        `Lỗi khi xoá category: ${error instanceof Error ? error.message : 'Lỗi không xác định'}`,
      );
    }
  }
  async getProductsByCategory(category_id: number) {
    return await this.prisma.products.findMany({
      where: { category_id },
    });
  }
}
