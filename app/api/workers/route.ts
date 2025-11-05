import { NextRequest, NextResponse } from 'next/server'
import { adminDb } from '@/lib/firebase-admin'
import { WorkerProfile } from '@/lib/types'

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const workType = searchParams.get('workType')
    const limit = parseInt(searchParams.get('limit') || '20')

    let query = adminDb.collection('workers')
      .where('aadhaarVerified', '==', true)
      .orderBy('rating', 'desc')
      .limit(limit)

    if (workType) {
      query = query.where('workType', 'array-contains', workType) as any
    }

    const snapshot = await query.get()
    const workers: WorkerProfile[] = []

    snapshot.forEach((doc) => {
      workers.push({ ...doc.data(), uid: doc.id } as WorkerProfile)
    })

    return NextResponse.json({ workers, count: workers.length })
  } catch (error) {
    console.error('Error fetching workers:', error)
    return NextResponse.json(
      { error: 'Failed to fetch workers' },
      { status: 500 }
    )
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { uid, ...workerData } = body

    await adminDb.collection('workers').doc(uid).set({
      ...workerData,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    })

    return NextResponse.json({ success: true, uid })
  } catch (error) {
    console.error('Error creating worker profile:', error)
    return NextResponse.json(
      { error: 'Failed to create worker profile' },
      { status: 500 }
    )
  }
}