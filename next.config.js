/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ['imgix.cosmicjs.com', 'images.unsplash.com'],
  },
  // Ensure Next.js uses the app directory
  experimental: {
    appDir: true,
  },
};

module.exports = nextConfig;