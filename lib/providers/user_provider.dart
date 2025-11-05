import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/worker_profile.dart';
import '../models/employer_profile.dart';
import '../services/firestore_service.dart';

class UserProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  
  UserModel? _user;
  WorkerProfile? _workerProfile;
  EmployerProfile? _employerProfile;
  bool _isLoading = false;
  
  UserModel? get user => _user;
  WorkerProfile? get workerProfile => _workerProfile;
  EmployerProfile? get employerProfile => _employerProfile;
  bool get isLoading => _isLoading;
  bool get isWorker => _user?.role == 'worker';
  bool get isEmployer => _user?.role == 'employer';
  
  Future<void> loadUser(String uid) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final userData = await _firestoreService.getUser(uid);
      if (userData != null) {
        _user = UserModel.fromJson(userData);
        
        if (_user!.role == 'worker') {
          await loadWorkerProfile(uid);
        } else if (_user!.role == 'employer') {
          await loadEmployerProfile(uid);
        }
      }
    } catch (e) {
      print('Error loading user: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> loadWorkerProfile(String uid) async {
    try {
      _workerProfile = await _firestoreService.getWorkerProfile(uid);
      notifyListeners();
    } catch (e) {
      print('Error loading worker profile: $e');
    }
  }
  
  Future<void> loadEmployerProfile(String uid) async {
    try {
      _employerProfile = await _firestoreService.getEmployerProfile(uid);
      notifyListeners();
    } catch (e) {
      print('Error loading employer profile: $e');
    }
  }
  
  Future<void> createWorkerProfile(WorkerProfile profile) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      await _firestoreService.createWorkerProfile(profile);
      _workerProfile = profile;
    } catch (e) {
      print('Error creating worker profile: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> createEmployerProfile(EmployerProfile profile) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      await _firestoreService.createEmployerProfile(profile);
      _employerProfile = profile;
    } catch (e) {
      print('Error creating employer profile: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  void clearUser() {
    _user = null;
    _workerProfile = null;
    _employerProfile = null;
    notifyListeners();
  }
}