import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;
  
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;
  
  AuthProvider() {
    _authService.authStateChanges.listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }
  
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(String) onError,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      await _authService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        onCodeSent: (verificationId) {
          _isLoading = false;
          notifyListeners();
          onCodeSent(verificationId);
        },
        onError: (error) {
          _isLoading = false;
          _errorMessage = error.message;
          notifyListeners();
          onError(error.message ?? 'Verification failed');
        },
        onVerificationCompleted: (credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          _isLoading = false;
          notifyListeners();
        },
      );
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      onError(e.toString());
    }
  }
  
  Future<bool> signInWithOTP({
    required String verificationId,
    required String otp,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      await _authService.signInWithOTP(
        verificationId: verificationId,
        otp: otp,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
  
  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }
}