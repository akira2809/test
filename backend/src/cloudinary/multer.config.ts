import { v2 as cloudinary } from 'cloudinary';
import { CloudinaryStorage } from 'multer-storage-cloudinary';
import multer from 'multer';

const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: (req, file) => ({
    folder: 'products', // Định rõ thư mục upload
    format: file.mimetype.split('/')[1], // Tự động lấy format từ mimetype
    public_id: file.originalname.split('.')[0], // Lấy tên file làm public_id
  }),
});

export const multerOptions = multer({ storage });
