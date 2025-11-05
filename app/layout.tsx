import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Dehadi - Rozgaar Har Haath Tak',
  description: 'A platform connecting rural workers with employers in India',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className="antialiased bg-gray-50">
        {children}
      </body>
    </html>
  )
}