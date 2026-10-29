import './globals.css';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'KAIRO | Listening Room',
  description: 'A nostalgic anime-inspired listening room with a tactile 3D music player.',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
