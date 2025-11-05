import Link from 'next/link'
import { ArrowLeft, Download, Smartphone } from 'lucide-react'

export default function WorkerRegisterPage() {
  // These would be replaced with actual app store links when available
  const androidAppUrl = 'https://play.google.com/store' // Replace with actual Play Store link
  const iosAppUrl = 'https://apps.apple.com' // Replace with actual App Store link
  
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
          <div className="flex items-center gap-3 mb-6">
            <Smartphone className="w-10 h-10 text-blue-600" />
            <h1 className="text-3xl font-bold text-gray-900">Worker Registration</h1>
          </div>
          
          <p className="text-gray-600 mb-8">
            To register as a worker, please download our mobile app for the best experience.
            The mobile app provides full access to job matching, notifications, and profile management.
          </p>
          
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-6">
            <h2 className="text-xl font-semibold mb-4 text-blue-900">Download the Dehadi Mobile App</h2>
            <p className="text-blue-800 mb-4">
              Available on Android and iOS
            </p>
            <div className="flex gap-4 flex-wrap">
              <a 
                href={androidAppUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium transition-colors"
              >
                <Download className="w-5 h-5" />
                Download on Android
              </a>
              <a 
                href={iosAppUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-6 py-3 bg-gray-800 text-white rounded-lg hover:bg-gray-900 font-medium transition-colors"
              >
                <Download className="w-5 h-5" />
                Download on iOS
              </a>
            </div>
            <p className="text-sm text-gray-600 mt-4">
              * App store links will be available once the mobile app is published
            </p>
          </div>

          <div className="mt-8 border-t pt-8">
            <h3 className="text-lg font-semibold mb-4 text-gray-900">Features for Workers:</h3>
            <ul className="space-y-2 text-gray-600">
              <li className="flex items-start gap-2">
                <span className="text-blue-600 font-bold">✓</span>
                <span>Find jobs near your location with GPS-based matching</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600 font-bold">✓</span>
                <span>Get instant job notifications via SMS and WhatsApp</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600 font-bold">✓</span>
                <span>Build your profile with ratings and reviews from employers</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600 font-bold">✓</span>
                <span>Join community groups for large projects and better opportunities</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600 font-bold">✓</span>
                <span>Available in Hindi and English with voice support</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-blue-600 font-bold">✓</span>
                <span>Secure Aadhaar-based verification for trusted employment</span>
              </li>
            </ul>
          </div>

          <div className="mt-8 bg-gray-50 rounded-lg p-6">
            <h3 className="text-lg font-semibold mb-3 text-gray-900">How to Get Started:</h3>
            <ol className="space-y-3 text-gray-600">
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">1</span>
                <span>Download the app from Google Play Store or Apple App Store</span>
              </li>
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">2</span>
                <span>Complete your profile with Aadhaar verification</span>
              </li>
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">3</span>
                <span>Browse available jobs in your area and apply instantly</span>
              </li>
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-6 h-6 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">4</span>
                <span>Get hired and start earning immediately</span>
              </li>
            </ol>
          </div>
        </div>
      </main>
    </div>
  )
}