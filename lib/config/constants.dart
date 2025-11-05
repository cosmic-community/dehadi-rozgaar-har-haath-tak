class AppConstants {
  // App Information
  static const String appName = 'Dehadi';
  static const String appTagline = 'Rozgaar Har Haath Tak';
  static const String appVersion = '1.0.0';
  
  // Job Categories
  static const List<String> jobCategories = [
    'Mason',
    'Painter',
    'Carpenter',
    'Mechanic (Car/Bike)',
    'Refrigerator Repair',
    'Washing Machine Repair',
    'Electrician',
    'Plumber',
    'Cleaner',
  ];
  
  // Job Categories in Hindi
  static const List<String> jobCategoriesHindi = [
    'राजमिस्त्री',
    'पेंटर',
    'बढ़ई',
    'मैकेनिक (कार/बाइक)',
    'फ्रिज रिपेयर',
    'वॉशिंग मशीन रिपेयर',
    'इलेक्ट्रीशियन',
    'प्लंबर',
    'सफाई कर्मी',
  ];
  
  // Community Groups
  static const List<String> communityGroups = [
    'Construction',
    'Electrical',
    'Plumbing',
    'Cleaning',
    'Mechanical',
    'Repair Services',
    'General Labor',
  ];
  
  // Community Groups in Hindi
  static const List<String> communityGroupsHindi = [
    'निर्माण',
    'बिजली का काम',
    'पाइप का काम',
    'सफाई',
    'मैकेनिकल',
    'मरम्मत सेवाएं',
    'सामान्य श्रम',
  ];
  
  // Job Status
  static const String jobStatusActive = 'active';
  static const String jobStatusClosed = 'closed';
  static const String jobStatusCompleted = 'completed';
  
  // Application Status
  static const String applicationStatusPending = 'pending';
  static const String applicationStatusAccepted = 'accepted';
  static const String applicationStatusRejected = 'rejected';
  
  // User Roles
  static const String roleWorker = 'worker';
  static const String roleEmployer = 'employer';
  
  // Notification Types
  static const String notificationJobMatch = 'job_match';
  static const String notificationJobUpdate = 'job_update';
  static const String notificationApplicationUpdate = 'application_update';
  
  // Default Values
  static const double defaultJobRadiusKm = 10.0;
  static const int minimumWage = 300;
  static const int maximumWage = 2000;
  static const int communityGroupThreshold = 5; // Workers needed for group option
  
  // Validation
  static const int aadhaarLength = 12;
  static const int phoneNumberLength = 10;
  static const int otpLength = 6;
  
  // Date Formats
  static const String dateFormat = 'dd MMM yyyy';
  static const String dateTimeFormat = 'dd MMM yyyy, hh:mm a';
  
  // Asset Paths
  static const String logoPath = 'assets/images/logo.png';
  static const String workerIconPath = 'assets/icons/worker.svg';
  static const String employerIconPath = 'assets/icons/employer.svg';
}