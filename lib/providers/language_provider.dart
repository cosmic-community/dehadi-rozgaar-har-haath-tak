import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('en', 'US');
  
  Locale get locale => _locale;
  String get languageCode => _locale.languageCode;
  bool get isHindi => _locale.languageCode == 'hi';
  bool get isEnglish => _locale.languageCode == 'en';
  
  LanguageProvider() {
    _loadLanguagePreference();
  }
  
  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('languageCode') ?? 'en';
    _locale = languageCode == 'hi' ? const Locale('hi', 'IN') : const Locale('en', 'US');
    notifyListeners();
  }
  
  Future<void> setLanguage(String languageCode) async {
    _locale = languageCode == 'hi' ? const Locale('hi', 'IN') : const Locale('en', 'US');
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
    
    notifyListeners();
  }
  
  Future<void> toggleLanguage() async {
    final newLanguageCode = isEnglish ? 'hi' : 'en';
    await setLanguage(newLanguageCode);
  }
}