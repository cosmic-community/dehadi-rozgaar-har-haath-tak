# Dehadi - Rozgaar Har Haath Tak

A comprehensive platform connecting rural workers with employers across India. This repository contains both the web frontend and mobile app integration.

## Architecture

### Web Frontend (Next.js)
- Landing page and marketing site
- API routes for database access
- Integration with Firebase Firestore and Cosmic CMS

### Mobile App (Flutter)
- Worker and employer mobile applications
- Firebase Authentication and Firestore database
- Real-time job matching and notifications

### Database (Firebase Firestore)
Collections:
- `users` - User authentication and basic info
- `workers` - Worker profiles with skills and availability
- `employers` - Employer profiles and business info
- `jobs` - Job postings with location and requirements
- `applications` - Job applications and status
- `ratings` - Worker and employer ratings/reviews

### Content Management (Cosmic CMS)
- Job categories
- Community groups
- App configuration

## Setup Instructions

### Prerequisites
- Node.js 18.17.0 or higher
- Firebase project with Firestore enabled
- Cosmic CMS bucket

### Environment Variables

Create a `.env.local` file in the root directory:

```bash
# Cosmic CMS Configuration
COSMIC_BUCKET_SLUG=your-bucket-slug
COSMIC_READ_KEY=your-read-key
COSMIC_WRITE_KEY=your-write-key

# Firebase Admin SDK Configuration
FIREBASE_PROJECT_ID=your-firebase-project-id
FIREBASE_CLIENT_EMAIL=your-firebase-client-email
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nyour-firebase-private-key\n-----END PRIVATE KEY-----\n"
```

### Installation

```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Build for production
npm run build

# Start production server
npm start
```

## API Endpoints

### Workers
- `GET /api/workers` - List workers
- `GET /api/workers/[uid]` - Get worker details
- `POST /api/workers` - Create worker profile
- `PATCH /api/workers/[uid]` - Update worker profile

### Employers
- `GET /api/employers` - List employers
- `POST /api/employers` - Create employer profile

### Jobs
- `GET /api/jobs` - List jobs
- `GET /api/jobs/[jobId]` - Get job details
- `POST /api/jobs` - Create job posting
- `PATCH /api/jobs/[jobId]` - Update job
- `DELETE /api/jobs/[jobId]` - Delete job

### Applications
- `GET /api/jobs/[jobId]/applications` - List applications for a job
- `POST /api/jobs/[jobId]/applications` - Apply for a job
- `PATCH /api/applications/[applicationId]` - Update application status

### Ratings
- `GET /api/ratings` - List ratings
- `POST /api/ratings` - Create rating/review

## Firebase Setup

1. Create a Firebase project at https://console.firebase.google.com
2. Enable Firestore Database
3. Enable Authentication with Phone provider
4. Generate a service account key:
   - Go to Project Settings > Service Accounts
   - Click "Generate New Private Key"
   - Download the JSON file
5. Add the credentials to your `.env.local` file

## Cosmic CMS Setup

1. Create a bucket at https://app.cosmicjs.com
2. Add the Object Types from the repository (job-categories, community-groups)
3. Add your bucket credentials to `.env.local`

## Mobile App Setup

See the Flutter mobile app documentation in the `/lib` directory for mobile-specific setup instructions.

## Features

### For Workers
- Profile creation with Aadhaar verification
- GPS-based job matching
- Real-time job notifications via SMS/WhatsApp
- Rating and review system
- Community group participation

### For Employers
- Job posting with detailed requirements
- Worker profile browsing with ratings
- Application management
- Bulk hiring for large projects
- Secure payment integration

## Tech Stack

- **Frontend**: Next.js 15, React 19, TypeScript, Tailwind CSS
- **Backend**: Next.js API Routes, Firebase Admin SDK
- **Database**: Firebase Firestore
- **CMS**: Cosmic CMS
- **Mobile**: Flutter, Firebase
- **Authentication**: Firebase Auth (Phone)
- **Hosting**: Vercel (recommended)

## License

Copyright © 2024 Dehadi. All rights reserved.