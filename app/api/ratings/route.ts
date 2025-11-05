import { NextRequest, NextResponse } from 'next/server'
import { adminDb } from '@/lib/firebase-admin'
import { Rating } from '@/lib/types'

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const workerId = searchParams.get('workerId')
    const employerId = searchParams.get('employerId')

    let query = adminDb.collection('ratings').orderBy('createdAt', 'desc')

    if (workerId) {
      query = query.where('workerId', '==', workerId) as any
    } else if (employerId) {
      query = query.where('employerId', '==', employerId) as any
    }

    const snapshot = await query.limit(50).get()
    const ratings: Rating[] = []

    snapshot.forEach((doc) => {
      ratings.push({ ...doc.data(), ratingId: doc.id } as Rating)
    })

    return NextResponse.json({ ratings, count: ratings.length })
  } catch (error) {
    console.error('Error fetching ratings:', error)
    return NextResponse.json(
      { error: 'Failed to fetch ratings' },
      { status: 500 }
    )
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    const docRef = await adminDb.collection('ratings').add({
      ...body,
      createdAt: new Date().toISOString(),
    })

    // Update worker's average rating
    const workerId = body.workerId
    const ratingsSnapshot = await adminDb.collection('ratings')
      .where('workerId', '==', workerId)
      .get()

    let totalRating = 0
    ratingsSnapshot.forEach((doc) => {
      totalRating += doc.data().rating
    })

    const avgRating = totalRating / ratingsSnapshot.size

    await adminDb.collection('workers').doc(workerId).update({
      rating: avgRating,
    })

    return NextResponse.json({ success: true, ratingId: docRef.id })
  } catch (error) {
    console.error('Error creating rating:', error)
    return NextResponse.json(
      { error: 'Failed to create rating' },
      { status: 500 }
    )
  }
}