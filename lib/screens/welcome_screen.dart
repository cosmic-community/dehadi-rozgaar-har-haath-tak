import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../config/constants.dart';
import '../providers/language_provider.dart';
import '../config/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // App Logo
              Icon(
                Icons.work_outline,
                size: 120,
                color: Colors.white,
              ),
              
              const SizedBox(height: 24),
              
              // App Name
              Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Tagline
              Text(
                AppConstants.appTagline,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Language Selection Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        'Select Language / भाषा चुनें',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // English Button
                      _LanguageButton(
                        label: 'English',
                        languageCode: 'en',
                        onTap: () => _onLanguageSelected(context, 'en'),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Hindi Button
                      _LanguageButton(
                        label: 'हिंदी (Hindi)',
                        languageCode: 'hi',
                        onTap: () => _onLanguageSelected(context, 'hi'),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
  
  void _onLanguageSelected(BuildContext context, String languageCode) {
    context.read<LanguageProvider>().setLanguage(languageCode);
    Navigator.pushNamed(context, AppRoutes.register);
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final String languageCode;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.languageCode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final isSelected = languageProvider.languageCode == languageCode;
    
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.white,
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: isSelected ? Colors.white : AppTheme.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}