import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'providers/language_provider.dart';
import 'screens/welcome_screen.dart';

class DehadiApp extends StatelessWidget {
  const DehadiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'Dehadi - Rozgaar Har Haath Tak',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          locale: languageProvider.locale,
          supportedLocales: const [
            Locale('en', 'US'), // English
            Locale('hi', 'IN'), // Hindi
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const WelcomeScreen(),
          routes: AppRoutes.routes,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}