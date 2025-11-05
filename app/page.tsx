import Link from 'next/link'
import { Briefcase, Users, MapPin, Shield, CheckCircle, Download, Star, Clock } from 'lucide-react'
import { getJobCategories } from '@/lib/cosmic'

export default async function HomePage() {
  const categories = await getJobCategories()
  
  // Default categories if Cosmic CMS is not configured
  const defaultCategories = [
    'Mason', 'Painter', 'Carpenter', 'Mechanic',
    'Electrician', 'Plumber', 'Cleaner', 'Repair'
  ]
  
  const displayCategories = categories.length > 0 
    ? categories.map(cat => cat.metadata.name_english)
    : defaultCategories

  return (
    <div className="min-h-screen">
      {/* Header */}
      <header className="bg-white shadow-sm sticky top-0 z-50">
        <nav className="container mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Briefcase className="w-8 h-8 text-blue-600" />
            <h1 className="text-2xl font-bold text-gray-900">Dehadi</h1>
          </div>
          <div className="flex items-center gap-4">
            <Link 
              href="/worker/register" 
              className="px-4 py-2 text-blue-600 hover:text-blue-700 font-medium transition-colors"
            >
              Find Work
            </Link>
            <Link 
              href="/employer/register" 
              className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium transition-colors"
            >
              Hire Workers
            </Link>
          </div>
        </nav>
      </header>

      {/* Hero Section */}
      <section className="bg-gradient-to-br from-blue-600 to-blue-800 text-white py-20">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-5xl font-bold mb-6">
            रोज़गार हर हाथ तक
          </h2>
          <p className="text-xl mb-4 text-blue-100">
            Connecting rural workers with employers across India
          </p>
          <p className="text-lg mb-8 text-blue-200">
            डिजिटल इंडिया के लिए डिजिटल रोज़गार
          </p>
          <div className="flex items-center justify-center gap-4 flex-wrap">
            <Link 
              href="/worker/register" 
              className="inline-flex items-center gap-2 px-8 py-3 bg-white text-blue-600 rounded-lg hover:bg-gray-100 font-semibold text-lg transition-colors"
            >
              <Users className="w-5 h-5" />
              I'm Looking for Work
            </Link>
            <Link 
              href="/employer/register" 
              className="inline-flex items-center gap-2 px-8 py-3 bg-blue-700 text-white rounded-lg hover:bg-blue-800 font-semibold text-lg border-2 border-white transition-colors"
            >
              <Briefcase className="w-5 h-5" />
              I Want to Hire
            </Link>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="py-12 bg-white border-b">
        <div className="container mx-auto px-4">
          <div className="grid md:grid-cols-4 gap-8 text-center">
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">10,000+</div>
              <div className="text-gray-600">Verified Workers</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">5,000+</div>
              <div className="text-gray-600">Active Employers</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">50,000+</div>
              <div className="text-gray-600">Jobs Posted</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">4.8⭐</div>
              <div className="text-gray-600">Average Rating</div>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h3 className="text-3xl font-bold text-center mb-12 text-gray-900">
            How It Works
          </h3>
          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-white rounded-lg p-6 shadow-md hover:shadow-lg transition-shadow">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <Users className="w-8 h-8 text-blue-600" />
              </div>
              <h4 className="text-xl font-semibold mb-2 text-gray-900 text-center">Register Your Profile</h4>
              <p className="text-gray-600 text-center">
                Create your profile as a worker or employer with your Aadhaar verification for trusted employment
              </p>
            </div>
            <div className="bg-white rounded-lg p-6 shadow-md hover:shadow-lg transition-shadow">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <MapPin className="w-8 h-8 text-blue-600" />
              </div>
              <h4 className="text-xl font-semibold mb-2 text-gray-900 text-center">Find Nearby Jobs</h4>
              <p className="text-gray-600 text-center">
                Browse jobs in your area or post work requirements with GPS-based location matching
              </p>
            </div>
            <div className="bg-white rounded-lg p-6 shadow-md hover:shadow-lg transition-shadow">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <CheckCircle className="w-8 h-8 text-blue-600" />
              </div>
              <h4 className="text-xl font-semibold mb-2 text-gray-900 text-center">Connect & Work</h4>
              <p className="text-gray-600 text-center">
                Get instant notifications via SMS/WhatsApp and connect directly with workers or employers
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Categories Section */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h3 className="text-3xl font-bold text-center mb-12 text-gray-900">
            Popular Job Categories
          </h3>
          <div className="grid md:grid-cols-4 gap-6">
            {displayCategories.map((category) => (
              <div key={category} className="bg-gray-50 p-6 rounded-lg shadow-sm hover:shadow-md transition-shadow text-center border border-gray-200">
                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-3">
                  <Briefcase className="w-6 h-6 text-blue-600" />
                </div>
                <h4 className="font-semibold text-gray-900">{category}</h4>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Trust Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-center gap-2 mb-6">
            <Shield className="w-12 h-12 text-blue-600" />
            <h3 className="text-3xl font-bold text-gray-900">Trusted & Secure</h3>
          </div>
          <p className="text-center text-gray-600 max-w-2xl mx-auto mb-8">
            All workers are verified with Aadhaar authentication and phone number verification. 
            Employers are verified to ensure safe and secure job opportunities for everyone.
          </p>
          <div className="grid md:grid-cols-3 gap-6 max-w-3xl mx-auto">
            <div className="bg-white rounded-lg p-6 shadow-md text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">100%</div>
              <div className="text-gray-600">Verified Profiles</div>
              <Shield className="w-8 h-8 text-blue-600 mx-auto mt-4" />
            </div>
            <div className="bg-white rounded-lg p-6 shadow-md text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">24/7</div>
              <div className="text-gray-600">Support Available</div>
              <Clock className="w-8 h-8 text-blue-600 mx-auto mt-4" />
            </div>
            <div className="bg-white rounded-lg p-6 shadow-md text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">50km</div>
              <div className="text-gray-600">Job Radius Search</div>
              <MapPin className="w-8 h-8 text-blue-600 mx-auto mt-4" />
            </div>
          </div>
        </div>
      </section>

      {/* Download CTA Section */}
      <section className="py-16 bg-blue-600 text-white">
        <div className="container mx-auto px-4 text-center">
          <Download className="w-16 h-16 mx-auto mb-6" />
          <h3 className="text-3xl font-bold mb-4">Download the Dehadi App Today</h3>
          <p className="text-xl mb-8 text-blue-100">
            Start finding work or hiring workers in minutes
          </p>
          <div className="flex items-center justify-center gap-4 flex-wrap">
            <Link 
              href="/worker/register" 
              className="inline-flex items-center gap-2 px-8 py-3 bg-white text-blue-600 rounded-lg hover:bg-gray-100 font-semibold text-lg transition-colors"
            >
              <Download className="w-5 h-5" />
              For Workers
            </Link>
            <Link 
              href="/employer/register" 
              className="inline-flex items-center gap-2 px-8 py-3 bg-blue-700 text-white rounded-lg hover:bg-blue-800 font-semibold text-lg border-2 border-white transition-colors"
            >
              <Download className="w-5 h-5" />
              For Employers
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-12">
        <div className="container mx-auto px-4">
          <div className="grid md:grid-cols-4 gap-8 mb-8">
            <div>
              <div className="flex items-center gap-2 mb-4">
                <Briefcase className="w-6 h-6" />
                <span className="text-xl font-bold">Dehadi</span>
              </div>
              <p className="text-gray-400">
                Connecting rural workers with employers across India
              </p>
            </div>
            <div>
              <h4 className="font-semibold mb-4">For Workers</h4>
              <ul className="space-y-2 text-gray-400">
                <li><Link href="/worker/register" className="hover:text-white transition-colors">Register</Link></li>
                <li><Link href="/worker/register" className="hover:text-white transition-colors">Find Jobs</Link></li>
                <li><Link href="/worker/register" className="hover:text-white transition-colors">Download App</Link></li>
              </ul>
            </div>
            <div>
              <h4 className="font-semibold mb-4">For Employers</h4>
              <ul className="space-y-2 text-gray-400">
                <li><Link href="/employer/register" className="hover:text-white transition-colors">Register</Link></li>
                <li><Link href="/employer/register" className="hover:text-white transition-colors">Post Jobs</Link></li>
                <li><Link href="/employer/register" className="hover:text-white transition-colors">Download App</Link></li>
              </ul>
            </div>
            <div>
              <h4 className="font-semibold mb-4">Support</h4>
              <ul className="space-y-2 text-gray-400">
                <li><a href="#" className="hover:text-white transition-colors">Help Center</a></li>
                <li><a href="#" className="hover:text-white transition-colors">Contact Us</a></li>
                <li><a href="#" className="hover:text-white transition-colors">Privacy Policy</a></li>
              </ul>
            </div>
          </div>
          <div className="border-t border-gray-800 pt-8 text-center">
            <p className="text-gray-400 mb-2">
              Connecting rural workers with employers across India
            </p>
            <p className="text-sm text-gray-500">
              © 2024 Dehadi. Built with ❤️ for the working community of India
            </p>
          </div>
        </div>
      </footer>
    </div>
  )
}