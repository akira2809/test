<<<<<<< HEAD
import Link from "next/link";
import "./globals.css"; // Import Tailwind

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="vi">
      <body className="bg-gray-100 text-gray-900">
        <header className="bg-blue-600 p-4 text-white">
          <nav className="flex justify-center space-x-4">
            <Link href="/" className="hover:underline">Trang chủ</Link>
            <Link href="/about" className="hover:underline">Giới thiệu</Link>
            <Link href="/contact" className="hover:underline">Liên hệ</Link>
          </nav>
        </header>

        <main className="container mx-auto p-4">{children}</main>

        <footer className="text-center p-4 bg-gray-800 text-white mt-4">
          <p>© 2025. Bản quyền thuộc về tôi 😎</p>
        </footer>
=======
import * as React from 'react';
import { AppRouterCacheProvider } from '@mui/material-nextjs/v15-appRouter';
import { ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';
import theme from '@/theme';
import InitColorSchemeScript from '@mui/material/InitColorSchemeScript';
import Footer from './components/Footer';
export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};
export default function RootLayout(props: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body>
        <InitColorSchemeScript attribute="class" />
        <AppRouterCacheProvider options={{ enableCssLayer: true }}>
          <ThemeProvider theme={theme}>
            <CssBaseline />
            {props.children}
            <Footer></Footer>
          </ThemeProvider>
        </AppRouterCacheProvider>
>>>>>>> main
      </body>
    </html>
  );
}
<<<<<<< HEAD
=======

>>>>>>> main
