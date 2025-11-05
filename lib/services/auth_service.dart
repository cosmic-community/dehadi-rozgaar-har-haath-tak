import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User? get currentUser => _auth.currentUser;
  
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(FirebaseAuthException) onError,
    required Function(PhoneAuthCredential) onVerificationCompleted,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onError,
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
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
  
  Future<void> signOut() async {
    await _auth.signOut();
  }
}