// app/api/jobs/[jobId]/applications/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { adminDb } from '@/lib/firebase-admin'
import { Application } from '@/lib/types'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ jobId: string }> }
) {
  try {
    const { jobId } = await params

    const snapshot = await adminDb.collection('applications')
      .where('jobId', '==', jobId)
      .orderBy('appliedAt', 'desc')
      .get()

    const applications: Application[] = []

    snapshot.forEach((doc) => {
      applications.push({ ...doc.data(), applicationId: doc.id } as Application)
    })

    return NextResponse.json({ applications, count: applications.length })
  } catch (error) {
    console.error('Error fetching applications:', error)
    return NextResponse.json(
      { error: 'Failed to fetch applications' },
      { status: 500 }
    )
  }
}

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ jobId: string }> }
) {
  try {
    const { jobId } = await params
    const body = await request.json()

    const docRef = await adminDb.collection('applications').add({
      ...body,
      jobId,
      status: 'pending',
      appliedAt: new Date().toISOString(),
    })

    // Increment applicants count
    await adminDb.collection('jobs').doc(jobId).update({
      applicantsCount: (adminDb as any).FieldValue.increment(1),
    })

    return NextResponse.json({ success: true, applicationId: docRef.id })
  } catch (error) {
    console.error('Error creating application:', error)
    return NextResponse.json(
      { error: 'Failed to create application' },
      { status: 500 }
    )
  }
}