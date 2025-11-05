import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'services/auth_service.dart';
import 'services/firestore_service.dart';
import 'services/cosmic_service.dart';
import 'services/notification_service.dart';
import 'services/location_service.dart';
import 'services/twilio_service.dart';
import 'providers/auth_provider.dart';
import 'providers/user_provider.dart';
import 'providers/job_provider.dart';
import 'providers/language_provider.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register services
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => FirestoreService());
  getIt.registerLazySingleton(() => CosmicService());
  getIt.registerLazySingleton(() => NotificationService());
  getIt.registerLazySingleton(() => LocationService());
  getIt.registerLazySingleton(() => TwilioService());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: '.env');
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Setup service locator
  setupServiceLocator();
  
  // Initialize notification service
  await getIt<NotificationService>().initialize();
  
  // Set system UI overlays
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const DehadiApp(),
    ),
  );
}