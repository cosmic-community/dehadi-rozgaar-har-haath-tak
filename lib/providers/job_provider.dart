import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../services/firestore_service.dart';

class JobProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  
  List<JobModel> _nearbyJobs = [];
  List<JobModel> _employerJobs = [];
  bool _isLoading = false;
  
  List<JobModel> get nearbyJobs => _nearbyJobs;
  List<JobModel> get employerJobs => _employerJobs;
  bool get isLoading => _isLoading;
  
  Future<void> fetchNearbyJobs({
    required String workType,
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  }) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _nearbyJobs = await _firestoreService.fetchNearbyJobs(
        workType: workType,
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
      );
    } catch (e) {
      print('Error fetching nearby jobs: $e');
      _nearbyJobs = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> fetchEmployerJobs(String employerId) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _employerJobs = await _firestoreService.fetchEmployerJobs(employerId);
    } catch (e) {
      print('Error fetching employer jobs: $e');
      _employerJobs = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<String?> createJob(JobModel job) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final jobId = await _firestoreService.createJob(job);
      _employerJobs.insert(0, job.copyWith(jobId: jobId));
      notifyListeners();
      return jobId;
    } catch (e) {
      print('Error creating job: $e');
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> updateJobStatus(String jobId, String status) async {
    try {
      await _firestoreService.updateJobStatus(jobId, status);
      
      // Update local list
      final index = _employerJobs.indexWhere((job) => job.jobId == jobId);
      if (index != -1) {
        _employerJobs[index] = _employerJobs[index].copyWith(status: status);
        notifyListeners();
      }
    } catch (e) {
      print('Error updating job status: $e');
    }
  }
  
  Future<void> applyForJob({
    required String jobId,
    required String workerId,
    required String workerName,
    required String workerPhone,
  }) async {
    try {
      await _firestoreService.applyForJob(
        jobId: jobId,
        workerId: workerId,
        workerName: workerName,
        workerPhone: workerPhone,
      );
      
      // Update applicants count locally
      final index = _nearbyJobs.indexWhere((job) => job.jobId == jobId);
      if (index != -1) {
        _nearbyJobs[index] = _nearbyJobs[index].copyWith(
          applicantsCount: _nearbyJobs[index].applicantsCount + 1,
        );
        notifyListeners();
      }
    } catch (e) {
      print('Error applying for job: $e');
    }
  }
}