import Link from 'next/link'
import { ArrowLeft, Download, Smartphone, Star } from 'lucide-react'

export default function WorkerRegisterPage() {
  // Play Store link - replace with actual URL when app is published
  const playStoreUrl = 'https://play.google.com/store/apps/details?id=com.dehadi.app'
  
  // App Store link - replace with actual URL when app is published
  const appStoreUrl = 'https://apps.apple.com/app/dehadi/id123456789'
  
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
          
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-6 mb-6">
            <h2 className="text-xl font-semibold mb-4 text-blue-900">Download the Dehadi Mobile App</h2>
            <p className="text-blue-800 mb-6">
              Available on Android and iOS - Join thousands of workers already finding jobs daily
            </p>
            <div className="flex gap-4 flex-wrap">
              <a 
                href={playStoreUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-3 px-6 py-4 bg-gray-900 text-white rounded-lg hover:bg-gray-800 font-medium transition-colors shadow-md"
              >
                <svg className="w-6 h-6" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z" />
                </svg>
                <div className="text-left">
                  <div className="text-xs">GET IT ON</div>
                  <div className="text-sm font-bold">Google Play</div>
                </div>
              </a>
              <a 
                href={appStoreUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-3 px-6 py-4 bg-gray-900 text-white rounded-lg hover:bg-gray-800 font-medium transition-colors shadow-md"
              >
                <svg className="w-6 h-6" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M18.71,19.5C17.88,20.74 17,21.95 15.66,21.97C14.32,22 13.89,21.18 12.37,21.18C10.84,21.18 10.37,21.95 9.1,22C7.79,22.05 6.8,20.68 5.96,19.47C4.25,17 2.94,12.45 4.7,9.39C5.57,7.87 7.13,6.91 8.82,6.88C10.1,6.86 11.32,7.75 12.11,7.75C12.89,7.75 14.37,6.68 15.92,6.84C16.57,6.87 18.39,7.1 19.56,8.82C19.47,8.88 17.39,10.1 17.41,12.63C17.44,15.65 20.06,16.66 20.09,16.67C20.06,16.74 19.67,18.11 18.71,19.5M13,3.5C13.73,2.67 14.94,2.04 15.94,2C16.07,3.17 15.6,4.35 14.9,5.19C14.21,6.04 13.07,6.7 11.95,6.61C11.8,5.46 12.36,4.26 13,3.5Z" />
                </svg>
                <div className="text-left">
                  <div className="text-xs">Download on the</div>
                  <div className="text-sm font-bold">App Store</div>
                </div>
              </a>
            </div>
            <p className="text-sm text-blue-700 mt-4 flex items-center gap-2">
              <Star className="w-4 h-4 fill-current" />
              Rated 4.8 stars by thousands of workers
            </p>
          </div>

          <div className="mt-8 border-t pt-8">
            <h3 className="text-lg font-semibold mb-4 text-gray-900">Features for Workers:</h3>
            <ul className="space-y-3 text-gray-600">
              <li className="flex items-start gap-3">
                <span className="text-blue-600 font-bold text-xl">✓</span>
                <span>Find jobs near your location with GPS-based matching</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-600 font-bold text-xl">✓</span>
                <span>Get instant job notifications via SMS and WhatsApp</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-600 font-bold text-xl">✓</span>
                <span>Build your profile with ratings and reviews from employers</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-600 font-bold text-xl">✓</span>
                <span>Join community groups for large projects and better opportunities</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-600 font-bold text-xl">✓</span>
                <span>Available in Hindi and English with voice support</span>
              </li>
              <li className="flex items-start gap-3">
                <span className="text-blue-600 font-bold text-xl">✓</span>
                <span>Secure Aadhaar-based verification for trusted employment</span>
              </li>
            </ul>
          </div>

          <div className="mt-8 bg-gradient-to-br from-blue-50 to-indigo-50 rounded-lg p-6 border border-blue-200">
            <h3 className="text-lg font-semibold mb-3 text-gray-900">How to Get Started:</h3>
            <ol className="space-y-3 text-gray-700">
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-7 h-7 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">1</span>
                <span><strong>Download the app</strong> from Google Play Store or Apple App Store</span>
              </li>
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-7 h-7 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">2</span>
                <span><strong>Complete your profile</strong> with Aadhaar verification and job categories</span>
              </li>
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-7 h-7 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">3</span>
                <span><strong>Browse available jobs</strong> in your area and apply instantly</span>
              </li>
              <li className="flex gap-3">
                <span className="flex-shrink-0 w-7 h-7 bg-blue-600 text-white rounded-full flex items-center justify-center text-sm font-bold">4</span>
                <span><strong>Get hired and start earning</strong> - receive payments directly</span>
              </li>
            </ol>
          </div>

          <div className="mt-8 text-center">
            <p className="text-sm text-gray-500">
              Having trouble downloading? Contact our support team for assistance
            </p>
          </div>
        </div>
      </main>
    </div>
  )
}