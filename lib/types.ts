export interface WorkerProfile {
  uid: string
  name: string
  phone: string
  workType: string[]
  location: {
    latitude: number
    longitude: number
    address: string
  }
  aadhaarVerified: boolean
  rating: number
  completedJobs: number
  experience: string
  availability: string
  profileImage?: string
  createdAt: string
  updatedAt: string
}

export interface EmployerProfile {
  uid: string
  name: string
  phone: string
  businessName?: string
  location: {
    latitude: number
    longitude: number
    address: string
  }
  verified: boolean
  rating: number
  jobsPosted: number
  createdAt: string
  updatedAt: string
}

export interface JobModel {
  jobId: string
  employerId: string
  employerName: string
  workType: string
  title: string
  description: string
  salaryMin: number
  salaryMax: number
  duration: string
  location: {
    latitude: number
    longitude: number
    address: string
  }
  status: 'active' | 'filled' | 'cancelled'
  applicantsCount: number
  postedAt: string
  expiresAt: string
}

export interface Application {
  applicationId: string
  jobId: string
  workerId: string
  workerName: string
  workerPhone: string
  status: 'pending' | 'accepted' | 'rejected'
  appliedAt: string
}

export interface Rating {
  ratingId: string
  workerId: string
  employerId: string
  jobId: string
  rating: number
  review: string
  createdAt: string
}