-- CreateTable
CREATE TABLE "blog" (
    "blog_id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "content" TEXT NOT NULL,
    "date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "author" VARCHAR(255) NOT NULL,

    CONSTRAINT "blog_pkey" PRIMARY KEY ("blog_id")
);

-- CreateTable
CREATE TABLE "blog_review" (
    "blog_review_id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "blog_id" INTEGER,
    "content" TEXT NOT NULL,
    "date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "blog_review_pkey" PRIMARY KEY ("blog_review_id")
);

-- CreateTable
CREATE TABLE "categories" (
    "category_id" SERIAL NOT NULL,
    "category" VARCHAR(255) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("category_id")
);

-- CreateTable
CREATE TABLE "collection" (
    "collection_id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "image" TEXT,
    "short_description" TEXT,

    CONSTRAINT "collection_pkey" PRIMARY KEY ("collection_id")
);

-- CreateTable
CREATE TABLE "image" (
    "image_id" SERIAL NOT NULL,
    "product_id" INTEGER,
    "image" TEXT NOT NULL,

    CONSTRAINT "image_pkey" PRIMARY KEY ("image_id")
);

-- CreateTable
CREATE TABLE "order_detail" (
    "order_detail_id" SERIAL NOT NULL,
    "order_id" INTEGER,
    "product_variant_id" INTEGER,
    "quantity" INTEGER NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "order_detail_pkey" PRIMARY KEY ("order_detail_id")
);

-- CreateTable
CREATE TABLE "orders" (
    "order_id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(50) NOT NULL,
    "phone_number" VARCHAR(20),
    "address" TEXT,
    "voucher_id" INTEGER,
    "total" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_id")
);

-- CreateTable
CREATE TABLE "payment_method" (
    "payment_method_id" SERIAL NOT NULL,
    "order_id" INTEGER,
    "payment_method" VARCHAR(50) NOT NULL,
    "payment_status" VARCHAR(50) NOT NULL,
    "update_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "payment_method_pkey" PRIMARY KEY ("payment_method_id")
);

-- CreateTable
CREATE TABLE "product_color" (
    "color_id" SERIAL NOT NULL,
    "color_name" VARCHAR(100) NOT NULL,
    "hex_color" VARCHAR(10),

    CONSTRAINT "product_color_pkey" PRIMARY KEY ("color_id")
);

-- CreateTable
CREATE TABLE "product_size" (
    "size_id" SERIAL NOT NULL,
    "size_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "product_size_pkey" PRIMARY KEY ("size_id")
);

-- CreateTable
CREATE TABLE "product_variants" (
    "product_variant_id" SERIAL NOT NULL,
    "product_id" INTEGER,
    "color_id" INTEGER,
    "size_id" INTEGER,
    "image_id" INTEGER,
    "stock" INTEGER NOT NULL,

    CONSTRAINT "product_variants_pkey" PRIMARY KEY ("product_variant_id")
);

-- CreateTable
CREATE TABLE "products" (
    "product_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(50),
    "base_price" DECIMAL(10,2) NOT NULL,
    "sale_price" DECIMAL(10,2),
    "description" TEXT,
    "short_description" TEXT,
    "main_image" TEXT,
    "status" BOOLEAN DEFAULT true,
    "collection_id" INTEGER,
    "category_id" INTEGER,

    CONSTRAINT "products_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "review" (
    "review_id" SERIAL NOT NULL,
    "order_detail_id" INTEGER,
    "user_id" INTEGER,
    "content" TEXT,
    "rating" INTEGER,
    "date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "review_pkey" PRIMARY KEY ("review_id")
);

-- CreateTable
CREATE TABLE "review_image" (
    "review_image_id" SERIAL NOT NULL,
    "review_id" INTEGER,
    "review_image" TEXT NOT NULL,

    CONSTRAINT "review_image_pkey" PRIMARY KEY ("review_image_id")
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "role" VARCHAR(50) NOT NULL,
    "phone_number" VARCHAR(20),
    "active" BOOLEAN DEFAULT true,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "voucher" (
    "voucher_id" SERIAL NOT NULL,
    "code" VARCHAR(50) NOT NULL,
    "day_start" DATE NOT NULL,
    "day_end" DATE NOT NULL,
    "value" DECIMAL(10,2) NOT NULL,
    "usage_limit" INTEGER,
    "min_order_value" DECIMAL(10,2),
    "status" BOOLEAN DEFAULT true,
    "description" TEXT,

    CONSTRAINT "voucher_pkey" PRIMARY KEY ("voucher_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "voucher_code_key" ON "voucher"("code");

-- AddForeignKey
ALTER TABLE "blog_review" ADD CONSTRAINT "blog_review_blog_id_fkey" FOREIGN KEY ("blog_id") REFERENCES "blog"("blog_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "blog_review" ADD CONSTRAINT "blog_review_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("product_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order_detail" ADD CONSTRAINT "order_detail_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order_detail" ADD CONSTRAINT "order_detail_product_variant_id_fkey" FOREIGN KEY ("product_variant_id") REFERENCES "product_variants"("product_variant_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "payment_method" ADD CONSTRAINT "payment_method_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product_variants" ADD CONSTRAINT "product_variants_color_id_fkey" FOREIGN KEY ("color_id") REFERENCES "product_color"("color_id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product_variants" ADD CONSTRAINT "product_variants_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("product_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product_variants" ADD CONSTRAINT "product_variants_size_id_fkey" FOREIGN KEY ("size_id") REFERENCES "product_size"("size_id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("category_id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_collection_id_fkey" FOREIGN KEY ("collection_id") REFERENCES "collection"("collection_id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_order_detail_id_fkey" FOREIGN KEY ("order_detail_id") REFERENCES "order_detail"("order_detail_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "review_image" ADD CONSTRAINT "review_image_review_id_fkey" FOREIGN KEY ("review_id") REFERENCES "review"("review_id") ON DELETE CASCADE ON UPDATE NO ACTION;
