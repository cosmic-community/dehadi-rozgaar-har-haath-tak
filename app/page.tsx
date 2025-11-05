import Link from 'next/link'
import { Briefcase, Users, MapPin, Shield, CheckCircle } from 'lucide-react'

export default function HomePage() {
  return (
    <div className="min-h-screen">
      {/* Header */}
      <header className="bg-white shadow-sm">
        <nav className="container mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Briefcase className="w-8 h-8 text-blue-600" />
            <h1 className="text-2xl font-bold text-gray-900">Dehadi</h1>
          </div>
          <div className="flex items-center gap-4">
            <Link 
              href="/worker/register" 
              className="px-4 py-2 text-blue-600 hover:text-blue-700 font-medium"
            >
              Find Work
            </Link>
            <Link 
              href="/employer/register" 
              className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium"
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
          <p className="text-xl mb-8 text-blue-100">
            Connecting rural workers with employers across India
          </p>
          <div className="flex items-center justify-center gap-4">
            <Link 
              href="/worker/register" 
              className="px-8 py-3 bg-white text-blue-600 rounded-lg hover:bg-gray-100 font-semibold text-lg"
            >
              I'm Looking for Work
            </Link>
            <Link 
              href="/employer/register" 
              className="px-8 py-3 bg-blue-700 text-white rounded-lg hover:bg-blue-800 font-semibold text-lg border-2 border-white"
            >
              I Want to Hire
            </Link>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h3 className="text-3xl font-bold text-center mb-12 text-gray-900">
            How It Works
          </h3>
          <div className="grid md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <Users className="w-8 h-8 text-blue-600" />
              </div>
              <h4 className="text-xl font-semibold mb-2 text-gray-900">Register Your Profile</h4>
              <p className="text-gray-600">
                Create your profile as a worker or employer with your Aadhaar verification
              </p>
            </div>
            <div className="text-center">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <MapPin className="w-8 h-8 text-blue-600" />
              </div>
              <h4 className="text-xl font-semibold mb-2 text-gray-900">Find Nearby Jobs</h4>
              <p className="text-gray-600">
                Browse jobs in your area or post work requirements with location-based matching
              </p>
            </div>
            <div className="text-center">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <CheckCircle className="w-8 h-8 text-blue-600" />
              </div>
              <h4 className="text-xl font-semibold mb-2 text-gray-900">Connect & Work</h4>
              <p className="text-gray-600">
                Get instant notifications and connect directly with workers or employers
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Categories Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h3 className="text-3xl font-bold text-center mb-12 text-gray-900">
            Job Categories
          </h3>
          <div className="grid md:grid-cols-4 gap-6">
            {[
              'Mason', 'Painter', 'Carpenter', 'Mechanic',
              'Electrician', 'Plumber', 'Cleaner', 'Repair'
            ].map((category) => (
              <div key={category} className="bg-white p-6 rounded-lg shadow-sm hover:shadow-md transition-shadow text-center">
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
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-center gap-2 mb-6">
            <Shield className="w-12 h-12 text-blue-600" />
            <h3 className="text-3xl font-bold text-gray-900">Trusted & Secure</h3>
          </div>
          <p className="text-center text-gray-600 max-w-2xl mx-auto mb-8">
            All workers are verified with Aadhaar authentication and phone number verification. 
            Employers are verified to ensure safe and secure job opportunities.
          </p>
          <div className="grid md:grid-cols-3 gap-6 max-w-3xl mx-auto">
            <div className="text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">100%</div>
              <div className="text-gray-600">Verified Profiles</div>
            </div>
            <div className="text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">24/7</div>
              <div className="text-gray-600">Support Available</div>
            </div>
            <div className="text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">50km</div>
              <div className="text-gray-600">Job Radius Search</div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-8">
        <div className="container mx-auto px-4 text-center">
          <div className="flex items-center justify-center gap-2 mb-4">
            <Briefcase className="w-6 h-6" />
            <span className="text-xl font-bold">Dehadi</span>
          </div>
          <p className="text-gray-400 mb-4">
            Connecting rural workers with employers across India
          </p>
          <p className="text-sm text-gray-500">
            Built with ❤️ for the working community of India
          </p>
        </div>
      </footer>
    </div>
  )
}