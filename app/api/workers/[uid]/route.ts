// app/api/workers/[uid]/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { adminDb } from '@/lib/firebase-admin'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uid: string }> }
) {
  try {
    const { uid } = await params
    const doc = await adminDb.collection('workers').doc(uid).get()

    if (!doc.exists) {
      return NextResponse.json(
        { error: 'Worker not found' },
        { status: 404 }
      )
    }

    return NextResponse.json({ worker: { ...doc.data(), uid: doc.id } })
  } catch (error) {
    console.error('Error fetching worker:', error)
    return NextResponse.json(
      { error: 'Failed to fetch worker' },
      { status: 500 }
    )
  }
}

export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ uid: string }> }
) {
  try {
    const { uid } = await params
    const body = await request.json()

    await adminDb.collection('workers').doc(uid).update({
      ...body,
      updatedAt: new Date().toISOString(),
    })

    return NextResponse.json({ success: true })
  } catch (error) {
    console.error('Error updating worker:', error)
    return NextResponse.json(
      { error: 'Failed to update worker' },
      { status: 500 }
    )
  }
}