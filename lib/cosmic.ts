import { createBucketClient } from '@cosmicjs/sdk'

const cosmic = createBucketClient({
  bucketSlug: process.env.COSMIC_BUCKET_SLUG as string,
  readKey: process.env.COSMIC_READ_KEY as string,
})

export interface JobCategory {
  id: string
  title: string
  slug: string
  metadata: {
    name_english: string
    name_hindi: string
    icon: string
    description_english: string
    description_hindi: string
  }
}

export interface CommunityGroup {
  id: string
  title: string
  slug: string
  metadata: {
    name_english: string
    name_hindi: string
    category: string
    description_english: string
    description_hindi: string
    verification_status: string
    member_count: number
  }
}

export async function getJobCategories(): Promise<JobCategory[]> {
  try {
    const { objects } = await cosmic.objects
      .find({ type: 'job-categories' })
      .props(['id', 'title', 'slug', 'metadata'])
      .depth(1)
    
    return objects as JobCategory[]
  } catch (error) {
    console.error('Error fetching job categories:', error)
    return []
  }
}

export async function getCommunityGroups(): Promise<CommunityGroup[]> {
  try {
    const { objects } = await cosmic.objects
      .find({ type: 'community-groups' })
      .props(['id', 'title', 'slug', 'metadata'])
      .depth(1)
    
    return objects as CommunityGroup[]
  } catch (error) {
    console.error('Error fetching community groups:', error)
    return []
  }
}

export { cosmic }