import { NextRequest, NextResponse } from 'next/server'
import { adminDb } from '@/lib/firebase-admin'
import { JobModel } from '@/lib/types'

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const workType = searchParams.get('workType')
    const status = searchParams.get('status') || 'active'
    const limit = parseInt(searchParams.get('limit') || '50')

    let query = adminDb.collection('jobs')
      .where('status', '==', status)
      .orderBy('postedAt', 'desc')
      .limit(limit)

    if (workType) {
      query = query.where('workType', '==', workType) as any
    }

    const snapshot = await query.get()
    const jobs: JobModel[] = []

    snapshot.forEach((doc) => {
      jobs.push({ ...doc.data(), jobId: doc.id } as JobModel)
    })

    return NextResponse.json({ jobs, count: jobs.length })
  } catch (error) {
    console.error('Error fetching jobs:', error)
    return NextResponse.json(
      { error: 'Failed to fetch jobs' },
      { status: 500 }
    )
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    const docRef = await adminDb.collection('jobs').add({
      ...body,
      status: 'active',
      applicantsCount: 0,
      postedAt: new Date().toISOString(),
    })

    return NextResponse.json({ success: true, jobId: docRef.id })
  } catch (error) {
    console.error('Error creating job:', error)
    return NextResponse.json(
      { error: 'Failed to create job' },
      { status: 500 }
    )
  }
}