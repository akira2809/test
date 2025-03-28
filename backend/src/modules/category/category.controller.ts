import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Patch,
  Delete,
} from '@nestjs/common';
import { CategoryService } from './category.service';
import { Prisma } from '@prisma/client';

@Controller('category')
export class CategoryController {
  constructor(private readonly categoryService: CategoryService) {}

  @Get()
  getAll() {
    return this.categoryService.getAll();
  }

  @Get(':id')
  getById(@Param('id') id: string) {
    return this.categoryService.getById(Number(id));
  }

  @Post()
  create(@Body() data: Prisma.categoriesCreateInput) {
    return this.categoryService.create(data);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() data: Prisma.categoriesUpdateInput) {
    return this.categoryService.update(Number(id), data);
  }

  @Delete(':id')
  delete(@Param('id') id: string) {
    return this.categoryService.delete(Number(id));
  }
  @Get(':id/product')
  async getProductsByCategory(@Param('id') category_id: string) {
    return this.categoryService.getProductsByCategory(Number(category_id));
  }
}
