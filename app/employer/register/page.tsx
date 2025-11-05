import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'

export default function EmployerRegisterPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow-sm">
        <div className="container mx-auto px-4 py-4">
          <Link href="/" className="flex items-center gap-2 text-blue-600 hover:text-blue-700">
            <ArrowLeft className="w-5 h-5" />
            <span className="font-medium">Back to Home</span>
          </Link>
        </div>
      </header>

      <main className="container mx-auto px-4 py-12">
        <div className="max-w-2xl mx-auto bg-white rounded-lg shadow-md p-8">
          <h1 className="text-3xl font-bold mb-6 text-gray-900">Employer Registration</h1>
          <p className="text-gray-600 mb-8">
            To register as an employer and post job requirements, please download our mobile app.
            The mobile app provides full access to worker profiles, applicant management, and hiring tools.
          </p>
          
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-6">
            <h2 className="text-xl font-semibold mb-4 text-blue-900">Download the Dehadi Mobile App</h2>
            <p className="text-blue-800 mb-4">
              Available on Android and iOS
            </p>
            <div className="flex gap-4">
              <button className="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium">
                Download on Android
              </button>
              <button className="px-6 py-3 bg-gray-800 text-white rounded-lg hover:bg-gray-900 font-medium">
                Download on iOS
              </button>
            </div>
          </div>

          <div className="mt-8 border-t pt-8">
            <h3 className="text-lg font-semibold mb-4 text-gray-900">Features for Employers:</h3>
            <ul className="space-y-2 text-gray-600">
              <li className="flex items-start gap-2">
                <span className="text-blue-600">✓</span>
                <span>Post job requirements with location and category</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600">✓</span>
                <span>Browse verified worker profiles in your area</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600">✓</span>
                <span>Review worker ratings and previous work history</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600">✓</span>
                <span>Hire community groups for large projects</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600">✓</span>
                <span>Manage applicants and track hiring status</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600">✓</span>
                <span>Available in Hindi and English</span>
              </li>
            </ul>
          </div>
        </div>
      </main>
    </div>
  )
}