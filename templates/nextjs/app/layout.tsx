import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: '__PROJECT_NAME__',
  description: 'Starter application generated from template-factory',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
