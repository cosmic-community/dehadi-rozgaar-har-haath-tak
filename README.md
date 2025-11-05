# Dehadi - Rozgaar Har Haath Tak

![App Preview](https://images.unsplash.com/photo-1521791136064-7986c2920216?w=1200&h=300&fit=crop&auto=format)

**Dehadi** is a comprehensive mobile application connecting rural workers with employers across India. Built with Flutter and Firebase, the app provides a bilingual (Hindi/English) platform for daily wage workers to find employment and for employers to hire skilled labor efficiently.

## ✨ Features

- **Dual Role System**: Users can register as workers seeking employment or employers looking to hire
- **Multi-language Support**: Complete Hindi and English interface with seamless language switching
- **Aadhaar-based Registration**: Secure authentication using Aadhaar number and mobile OTP verification
- **Smart Job Matching**: Location-based job recommendations with proximity calculations
- **Real-time Notifications**: Multi-channel alerts via Firebase Cloud Messaging, SMS, and WhatsApp
- **Community Groups**: Verified worker groups for large-scale projects requiring 5+ workers
- **Comprehensive Job Categories**: Mason, Painter, Carpenter, Mechanic, Repair technicians, Electrician, Plumber, Cleaner
- **Rating System**: Employer reviews to build worker reputation and visibility
- **GPS Integration**: Accurate location services for job proximity matching
- **Accessible UI**: Large buttons, clear icons, and high-contrast design for low-literacy users
- **Dashboard Management**: Separate dashboards for workers and employers to manage jobs and applications

## 📱 Clone this Project

## Clone this Project

Want to create your own version of this project with all the content and structure? Clone this Cosmic bucket and code repository to get started instantly:

[![Clone this Project](https://img.shields.io/badge/Clone%20this%20Project-29abe2?style=for-the-badge&logo=cosmic&logoColor=white)](https://app.cosmicjs.com/projects/new?clone_bucket=690b5893fb7423bbdde4ab7e&clone_repository=690b5debfb7423bbdde4abc9)

## Prompts

This application was built using the following prompts to generate the content structure and code:

### Content Model Prompt

> No content model prompt provided - app built with Firebase backend and Cosmic CMS for static content management

### Code Generation Prompt

> Build a complete, working mobile application named "Dehadi", designed to connect rural workers and employers in India. The app should support two main roles: Workers (who want jobs) and Employers (who want to hire). Use Flutter for frontend (Android + iOS). Use Firebase (Firestore + Auth + Cloud Messaging) as backend. Use Twilio or WhatsApp API for sending job notifications. Support Hindi and English languages (multi-language switch). Include clean UI, big buttons, and icons for low-literacy users.

The app has been tailored to work with Firebase backend infrastructure and includes Cosmic CMS integration for managing static content, job categories, and community group information.

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile framework (Android + iOS)
- **Firebase Authentication**: Secure user authentication with phone number verification
- **Firebase Firestore**: Real-time NoSQL database for storing user profiles, jobs, and applications
- **Firebase Cloud Messaging**: Push notifications for job alerts
- **Firebase Storage**: Profile pictures and document storage
- **Twilio API**: SMS notifications for job matches
- **WhatsApp Business API**: WhatsApp notifications integration
- **Google Maps API**: Location services and GPS tracking
- **Cosmic CMS**: Content management for app configuration and static content
- **Provider**: State management for Flutter
- **GetIt**: Dependency injection
- **Flutter Localizations**: Multi-language support (Hindi/English)

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.16.0 or higher ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode** (for iOS development on macOS)
- **Firebase Account**: [Create Firebase Project](https://console.firebase.google.com/)
- **Twilio Account**: [Sign up for Twilio](https://www.twilio.com/try-twilio) for SMS notifications
- **Cosmic CMS Account**: [Sign up for Cosmic](https://www.cosmicjs.com)
- **Google Maps API Key**: [Get API Key](https://developers.google.com/maps/documentation/javascript/get-api-key)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd dehadi
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

#### Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project named "Dehadi"
3. Enable Firebase Authentication (Phone provider)
4. Create a Firestore Database in production mode
5. Enable Firebase Cloud Messaging
6. Create Firebase Storage bucket

#### Configure Android App

1. In Firebase Console, add an Android app
2. Download `google-services.json`
3. Place it in `android/app/`
4. Update `android/app/build.gradle` with your package name

#### Configure iOS App

1. In Firebase Console, add an iOS app
2. Download `GoogleService-Info.plist`
3. Place it in `ios/Runner/`
4. Update `ios/Runner/Info.plist` with required permissions

### 4. Environment Variables

Create a `.env` file in the root directory:

```env
# Cosmic CMS Configuration
COSMIC_BUCKET_SLUG=your-bucket-slug
COSMIC_READ_KEY=your-read-key
COSMIC_WRITE_KEY=your-write-key

# Twilio Configuration
TWILIO_ACCOUNT_SID=your-twilio-account-sid
TWILIO_AUTH_TOKEN=your-twilio-auth-token
TWILIO_PHONE_NUMBER=your-twilio-phone-number

# WhatsApp Business API (optional)
WHATSAPP_API_KEY=your-whatsapp-api-key
WHATSAPP_PHONE_NUMBER=your-whatsapp-phone-number

# Google Maps API
GOOGLE_MAPS_API_KEY=your-google-maps-api-key

# Firebase (these are typically in google-services.json/GoogleService-Info.plist)
FIREBASE_PROJECT_ID=your-firebase-project-id
FIREBASE_API_KEY=your-firebase-api-key
```

### 5. Configure API Keys

#### Update Google Maps API Key

**Android**: Update `android/app/src/main/AndroidManifest.xml`

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
```

**iOS**: Update `ios/Runner/AppDelegate.swift`

```swift
GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
```

### 6. Cosmic CMS Setup

1. Create a Cosmic bucket for your app content
2. Create the following Object Types in Cosmic:

#### Job Categories Object Type
- **Title**: Job Categories
- **Slug**: job-categories
- **Metafields**:
  - `name_english` (Text)
  - `name_hindi` (Text)
  - `icon` (Text - icon name)
  - `description_english` (Textarea)
  - `description_hindi` (Textarea)

#### Community Groups Object Type
- **Title**: Community Groups
- **Slug**: community-groups
- **Metafields**:
  - `name_english` (Text)
  - `name_hindi` (Text)
  - `category` (Select Dropdown: Construction, Electrical, Plumbing, Cleaning, Mechanical, Repair, General)
  - `description_english` (Textarea)
  - `description_hindi` (Textarea)
  - `verification_status` (Select Dropdown: Pending, Verified, Rejected)
  - `member_count` (Number)

#### App Configuration Object Type
- **Title**: App Configuration
- **Slug**: app-configuration
- **Metafields**:
  - `minimum_wage` (Number)
  - `maximum_wage` (Number)
  - `job_radius_km` (Number)
  - `notification_enabled` (Switch)

### 7. Run the Application

#### For Android

```bash
flutter run
```

#### For iOS

```bash
flutter run --release
```

#### For specific device

```bash
flutter devices
flutter run -d <device-id>
```

### 8. Build Release APK/IPA

#### Android APK

```bash
flutter build apk --release
```

#### Android App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

#### iOS IPA

```bash
flutter build ipa --release
```

## 📱 Cosmic CMS Integration Examples

### Fetch Job Categories

```dart
// lib/services/cosmic_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class CosmicService {
  final String bucketSlug = 'YOUR_BUCKET_SLUG';
  final String readKey = 'YOUR_READ_KEY';
  
  Future<List<JobCategory>> fetchJobCategories() async {
    final response = await http.get(
      Uri.parse('https://api.cosmicjs.com/v3/buckets/$bucketSlug/objects'),
      headers: {
        'Authorization': 'Bearer $readKey',
      },
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['objects'] as List)
          .where((obj) => obj['type'] == 'job-categories')
          .map((obj) => JobCategory.fromJson(obj))
          .toList();
    }
    throw Exception('Failed to fetch job categories');
  }
}
```

### Fetch Community Groups

```dart
Future<List<CommunityGroup>> fetchCommunityGroups() async {
  final response = await http.get(
    Uri.parse('https://api.cosmicjs.com/v3/buckets/$bucketSlug/objects?query={"type":"community-groups"}'),
    headers: {
      'Authorization': 'Bearer $readKey',
    },
  );
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['objects'] as List)
        .map((obj) => CommunityGroup.fromJson(obj))
        .toList();
  }
  throw Exception('Failed to fetch community groups');
}
```

## 🔥 Firebase Integration

### User Authentication

```dart
// lib/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(FirebaseAuthException) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: onError,
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  
  Future<UserCredential> signInWithOTP({
    required String verificationId,
    required String otp,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    return await _auth.signInWithCredential(credential);
  }
}
```

### Firestore Data Management

```dart
// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  Future<void> createWorkerProfile(WorkerProfile profile) async {
    await _db.collection('workers').doc(profile.uid).set(profile.toJson());
  }
  
  Future<void> createEmployerProfile(EmployerProfile profile) async {
    await _db.collection('employers').doc(profile.uid).set(profile.toJson());
  }
  
  Future<List<Job>> fetchNearbyJobs({
    required double latitude,
    required double longitude,
    required double radiusKm,
  }) async {
    // Firestore doesn't support geoqueries natively
    // Use GeoFlutterFire package or implement manual filtering
    final snapshot = await _db.collection('jobs')
        .where('status', isEqualTo: 'active')
        .get();
    
    return snapshot.docs
        .map((doc) => Job.fromJson(doc.data()))
        .where((job) => _calculateDistance(
          latitude, longitude,
          job.latitude, job.longitude,
        ) <= radiusKm)
        .toList();
  }
}
```

## 🔔 Push Notifications Setup

### Firebase Cloud Messaging

```dart
// lib/services/notification_service.dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = 
      FlutterLocalNotificationsPlugin();
  
  Future<void> initialize() async {
    // Request permissions
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    
    // Get FCM token
    String? token = await _messaging.getToken();
    print('FCM Token: $token');
    
    // Initialize local notifications
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotifications.initialize(settings);
    
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }
  
  void _handleForegroundMessage(RemoteMessage message) {
    // Show local notification
    _showLocalNotification(message);
  }
}

// Top-level function for background messages
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print('Background message: ${message.messageId}');
}
```

## 🌐 Multi-language Support

The app includes complete Hindi and English translations. Language can be switched from the settings screen, and the preference is saved locally.

### Language Files Location

- `lib/l10n/app_en.arb` - English translations
- `lib/l10n/app_hi.arb` - Hindi translations

## 📱 App Architecture

```
lib/
├── main.dart                      # App entry point
├── app.dart                       # App configuration
├── config/
│   ├── routes.dart               # Navigation routes
│   ├── theme.dart                # App theme and colors
│   └── constants.dart            # App constants
├── models/
│   ├── user_model.dart           # User data model
│   ├── worker_profile.dart       # Worker profile model
│   ├── employer_profile.dart     # Employer profile model
│   ├── job_model.dart            # Job data model
│   ├── job_category.dart         # Job category model
│   └── community_group.dart      # Community group model
├── screens/
│   ├── welcome_screen.dart       # Welcome & language selection
│   ├── auth/
│   │   ├── register_screen.dart  # Registration screen
│   │   └── login_screen.dart     # Login screen
│   ├── role_selection_screen.dart # Role selection
│   ├── worker/
│   │   ├── worker_registration.dart
│   │   ├── worker_dashboard.dart
│   │   ├── job_list_screen.dart
│   │   └── worker_profile_screen.dart
│   ├── employer/
│   │   ├── employer_registration.dart
│   │   ├── employer_dashboard.dart
│   │   ├── post_job_screen.dart
│   │   ├── community_groups_screen.dart
│   │   └── applicants_screen.dart
│   └── shared/
│       ├── settings_screen.dart
│       └── notifications_screen.dart
├── services/
│   ├── auth_service.dart         # Authentication service
│   ├── firestore_service.dart    # Firestore operations
│   ├── cosmic_service.dart       # Cosmic CMS integration
│   ├── notification_service.dart # Push notifications
│   ├── location_service.dart     # GPS and location services
│   └── twilio_service.dart       # SMS notifications
├── providers/
│   ├── auth_provider.dart        # Authentication state
│   ├── user_provider.dart        # User data state
│   ├── job_provider.dart         # Job data state
│   └── language_provider.dart    # Language preference state
├── widgets/
│   ├── custom_button.dart        # Large accessible buttons
│   ├── custom_text_field.dart    # Form input fields
│   ├── job_card.dart             # Job display card
│   ├── worker_card.dart          # Worker profile card
│   └── language_switcher.dart    # Language toggle widget
├── utils/
│   ├── validators.dart           # Form validation
│   ├── date_formatter.dart       # Date utilities
│   └── distance_calculator.dart  # GPS distance calculations
└── l10n/
    ├── app_en.arb               # English translations
    └── app_hi.arb               # Hindi translations
```

## 🎨 UI Design Principles

The app follows these accessibility principles:

- **Large Touch Targets**: All buttons are minimum 48x48 dp for easy tapping
- **High Contrast**: Text and backgrounds use high contrast ratios (4.5:1 minimum)
- **Icon Support**: Every button includes both text and icon
- **Simple Navigation**: Maximum 3 levels deep navigation
- **Visual Feedback**: Loading states, success/error messages with colors
- **Bilingual**: All text content available in Hindi and English

## 🔒 Security Features

- Phone number verification via Firebase Auth OTP
- Aadhaar number validation (format check)
- Secure data storage in Firestore with security rules
- API keys stored in environment variables
- User data encryption at rest (Firebase default)
- Role-based access control for worker/employer features

## 📊 Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Workers collection
    match /workers/{workerId} {
      allow read: if true; // Public profiles
      allow write: if request.auth != null && request.auth.uid == workerId;
    }
    
    // Employers collection
    match /employers/{employerId} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == employerId;
    }
    
    // Jobs collection
    match /jobs/{jobId} {
      allow read: if true;
      allow create: if request.auth != null;
      allow update, delete: if request.auth != null && 
                              resource.data.employerId == request.auth.uid;
    }
    
    // Applications collection
    match /applications/{applicationId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null;
      allow update: if request.auth != null && 
                      (resource.data.workerId == request.auth.uid || 
                       resource.data.employerId == request.auth.uid);
    }
    
    // Ratings collection
    match /ratings/{ratingId} {
      allow read: if true;
      allow create, update: if request.auth != null;
    }
  }
}
```

## 🚀 Deployment

### Android Play Store

1. Update `android/app/build.gradle` with correct signing configuration
2. Create signing key: `keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`
3. Create `android/key.properties` with signing details
4. Build release bundle: `flutter build appbundle --release`
5. Upload to Google Play Console

### iOS App Store

1. Update `ios/Runner/Info.plist` with app information
2. Configure signing in Xcode with your Apple Developer account
3. Build archive: `flutter build ipa --release`
4. Upload to App Store Connect via Xcode or Transporter app

## 📱 Testing

### Run Tests

```bash
flutter test
```

### Integration Tests

```bash
flutter test integration_test
```

### Test Coverage

```bash
flutter test --coverage
```

## 🤝 Support & Documentation

- **Cosmic CMS Documentation**: [https://www.cosmicjs.com/docs](https://www.cosmicjs.com/docs)
- **Firebase Documentation**: [https://firebase.google.com/docs](https://firebase.google.com/docs)
- **Flutter Documentation**: [https://docs.flutter.dev](https://docs.flutter.dev)
- **Twilio Documentation**: [https://www.twilio.com/docs](https://www.twilio.com/docs)

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend infrastructure
- Cosmic CMS for content management capabilities
- Twilio for SMS notification services
- The open-source community for various packages and tools

---

Built with ❤️ for connecting rural workers with employment opportunities across India.

<!-- README_END -->