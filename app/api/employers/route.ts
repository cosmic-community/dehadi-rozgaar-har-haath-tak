import { NextRequest, NextResponse } from 'next/server'
import { adminDb } from '@/lib/firebase-admin'
import { EmployerProfile } from '@/lib/types'

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const limit = parseInt(searchParams.get('limit') || '20')

    const snapshot = await adminDb.collection('employers')
      .where('verified', '==', true)
      .orderBy('rating', 'desc')
      .limit(limit)
      .get()

    const employers: EmployerProfile[] = []

    snapshot.forEach((doc) => {
      employers.push({ ...doc.data(), uid: doc.id } as EmployerProfile)
    })

    return NextResponse.json({ employers, count: employers.length })
  } catch (error) {
    console.error('Error fetching employers:', error)
    return NextResponse.json(
      { error: 'Failed to fetch employers' },
      { status: 500 }
    )
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { uid, ...employerData } = body

    await adminDb.collection('employers').doc(uid).set({
      ...employerData,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    })

    return NextResponse.json({ success: true, uid })
  } catch (error) {
    console.error('Error creating employer profile:', error)
    return NextResponse.json(
      { error: 'Failed to create employer profile' },
      { status: 500 }
    )
  }
}