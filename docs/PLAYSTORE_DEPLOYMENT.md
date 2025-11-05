# docs/PLAYSTORE_DEPLOYMENT.md
# Google Play Store Deployment Guide for Dehadi Mobile App

This comprehensive guide will walk you through the process of uploading the Dehadi Flutter mobile app to the Google Play Store.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Create Google Play Developer Account](#create-google-play-developer-account)
3. [Generate Upload Keystore](#generate-upload-keystore)
4. [Configure App for Release](#configure-app-for-release)
5. [Build Release APK/AAB](#build-release-apkaab)
6. [Create Play Store Listing](#create-play-store-listing)
7. [Upload to Play Console](#upload-to-play-console)
8. [Testing and Review](#testing-and-review)
9. [Troubleshooting](#troubleshooting)

## Prerequisites

### Required Tools
- Flutter SDK (latest stable version)
- Android Studio or Android SDK command-line tools
- Java JDK 8 or higher
- Active Google Play Developer account ($25 one-time fee)

### Required Assets
Before starting, prepare these assets:
- **App Icon**: 512x512 PNG (32-bit PNG with alpha)
- **Feature Graphic**: 1024x500 PNG or JPEG
- **Screenshots**: At least 2 screenshots per device type
  - Phone: 16:9 or 9:16 ratio (recommended: 1080x1920)
  - 7-inch Tablet: Optional
  - 10-inch Tablet: Optional
- **Privacy Policy**: URL to hosted privacy policy (required)
- **App Description**: Short (80 chars) and full (4000 chars)

## Create Google Play Developer Account

1. **Visit Google Play Console**: https://play.google.com/console
2. **Sign in** with your Google account
3. **Pay the one-time registration fee** ($25 USD)
4. **Complete account details**:
   - Developer name (will be visible to users)
   - Email address for user contact
   - Phone number
   - Website (optional but recommended)
5. **Accept the Developer Distribution Agreement**
6. **Wait for account verification** (usually 24-48 hours)

## Generate Upload Keystore

A keystore is required to sign your app for release. **This is critical - if you lose your keystore, you cannot update your app!**

### Step 1: Generate Keystore

Run this command in your project's `android` directory:

```bash
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

You'll be prompted for:
- **Keystore password**: Choose a strong password (SAVE THIS!)
- **Key password**: Choose a strong password (SAVE THIS!)
- **First and Last Name**: Your name or company name
- **Organizational Unit**: Your department or team
- **Organization**: Your company name
- **City/Locality**: Your city
- **State/Province**: Your state
- **Country Code**: Two-letter country code (e.g., IN)

### Step 2: Store Keystore Securely

**CRITICAL: Backup your keystore file and passwords!**

1. **Store the keystore file** (`upload-keystore.jks`) in a secure location
2. **Create backup copies** on multiple secure storage locations
3. **Never commit to version control** - keystore is in .gitignore

### Step 3: Create key.properties File

In the `android` directory, create `key.properties`:

```properties
storePassword=YOUR_KEYSTORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=upload
storeFile=../upload-keystore.jks
```

**Replace** `YOUR_KEYSTORE_PASSWORD` and `YOUR_KEY_PASSWORD` with your actual passwords.

## Configure App for Release

### Step 1: Update App Version

Edit `pubspec.yaml`:

```yaml
version: 1.0.0+1
# Format: MAJOR.MINOR.PATCH+BUILD_NUMBER
# Example: 1.0.1+2 (version 1.0.1, build 2)
```

### Step 2: Review App Permissions

Check `android/app/src/main/AndroidManifest.xml` for necessary permissions. Remove any unused permissions to pass Play Store review.

### Step 3: Verify App ID

Ensure your `applicationId` in `android/app/build.gradle` is unique:

```gradle
defaultConfig {
    applicationId "com.dehadi.app"
    // Must be unique on Play Store
}
```

### Step 4: Add App Icons

Place your app icon files in:
- `android/app/src/main/res/mipmap-mdpi/ic_launcher.png` (48x48)
- `android/app/src/main/res/mipmap-hdpi/ic_launcher.png` (72x72)
- `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png` (96x96)
- `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png` (144x144)
- `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` (192x192)

## Build Release APK/AAB

### Build Android App Bundle (AAB) - Recommended

Google Play requires AAB format for new apps:

```bash
# From your project root directory
flutter clean
flutter pub get
flutter build appbundle --release
```

Your AAB will be created at: `build/app/outputs/bundle/release/app-release.aab`

### Build APK (for testing only)

```bash
flutter build apk --release
```

Your APK will be created at: `build/app/outputs/flutter-apk/app-release.apk`

### Verify Build

Test the release build on a physical device:

```bash
# Install APK on connected device
flutter install --release
```

## Create Play Store Listing

### Step 1: Create New App

1. Go to **Google Play Console**: https://play.google.com/console
2. Click **"Create app"**
3. Fill in app details:
   - **App name**: Dehadi - Rozgaar Har Haath Tak
   - **Default language**: English (United States)
   - **App or game**: App
   - **Free or paid**: Free
4. Complete declarations:
   - Privacy policy URL (required)
   - Target audience and content ratings
   - App access (full access or restricted)
   - Ads (does your app contain ads?)

### Step 2: Main Store Listing

Complete these sections in the Play Console:

#### App Details
- **Short description** (80 characters max):