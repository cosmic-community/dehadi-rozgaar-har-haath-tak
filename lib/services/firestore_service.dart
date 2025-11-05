import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/worker_profile.dart';
import '../models/employer_profile.dart';
import '../models/job_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  // User Management
  Future<void> createUser(Map<String, dynamic> userData) async {
    await _db.collection('users').doc(userData['uid']).set(userData);
  }
  
  Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.data();
  }
  
  // Worker Profile Management
  Future<void> createWorkerProfile(WorkerProfile profile) async {
    await _db.collection('workers').doc(profile.uid).set(profile.toJson());
  }
  
  Future<WorkerProfile?> getWorkerProfile(String uid) async {
    final doc = await _db.collection('workers').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return WorkerProfile.fromJson(doc.data()!);
    }
    return null;
  }
  
  Future<void> updateWorkerProfile(String uid, Map<String, dynamic> updates) async {
    await _db.collection('workers').doc(uid).update(updates);
  }
  
  // Employer Profile Management
  Future<void> createEmployerProfile(EmployerProfile profile) async {
    await _db.collection('employers').doc(profile.uid).set(profile.toJson());
  }
  
  Future<EmployerProfile?> getEmployerProfile(String uid) async {
    final doc = await _db.collection('employers').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return EmployerProfile.fromJson(doc.data()!);
    }
    return null;
  }
  
  Future<void> updateEmployerProfile(String uid, Map<String, dynamic> updates) async {
    await _db.collection('employers').doc(uid).update(updates);
  }
  
  // Job Management
  Future<String> createJob(JobModel job) async {
    final docRef = await _db.collection('jobs').add(job.toJson());
    return docRef.id;
  }
  
  Future<List<JobModel>> fetchNearbyJobs({
    required String workType,
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  }) async {
    try {
      final snapshot = await _db.collection('jobs')
          .where('status', isEqualTo: 'active')
          .where('workType', isEqualTo: workType)
          .get();
      
      return snapshot.docs
          .map((doc) {
            final data = doc.data();
            data['jobId'] = doc.id;
            return JobModel.fromJson(data);
          })
          .where((job) => _calculateDistance(
            latitude, longitude,
            job.latitude, job.longitude,
          ) <= radiusKm)
          .toList();
    } catch (error) {
      return [];
    }
  }
  
  Future<List<JobModel>> fetchEmployerJobs(String employerId) async {
    try {
      final snapshot = await _db.collection('jobs')
          .where('employerId', isEqualTo: employerId)
          .orderBy('postedAt', descending: true)
          .get();
      
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['jobId'] = doc.id;
        return JobModel.fromJson(data);
      }).toList();
    } catch (error) {
      return [];
    }
  }
  
  Future<void> updateJobStatus(String jobId, String status) async {
    await _db.collection('jobs').doc(jobId).update({'status': status});
  }
  
  // Job Application Management
  Future<void> applyForJob({
    required String jobId,
    required String workerId,
    required String workerName,
    required String workerPhone,
  }) async {
    await _db.collection('applications').add({
      'jobId': jobId,
      'workerId': workerId,
      'workerName': workerName,
      'workerPhone': workerPhone,
      'status': 'pending',
      'appliedAt': DateTime.now().toIso8601String(),
    });
    
    // Increment applicants count
    await _db.collection('jobs').doc(jobId).update({
      'applicantsCount': FieldValue.increment(1),
    });
  }
  
  Future<List<Map<String, dynamic>>> fetchJobApplications(String jobId) async {
    try {
      final snapshot = await _db.collection('applications')
          .where('jobId', isEqualTo: jobId)
          .get();
      
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['applicationId'] = doc.id;
        return data;
      }).toList();
    } catch (error) {
      return [];
    }
  }
  
  Future<void> updateApplicationStatus(String applicationId, String status) async {
    await _db.collection('applications').doc(applicationId).update({'status': status});
  }
  
  // Rating System
  Future<void> addRating({
    required String workerId,
    required String employerId,
    required String jobId,
    required double rating,
    required String review,
  }) async {
    await _db.collection('ratings').add({
      'workerId': workerId,
      'employerId': employerId,
      'jobId': jobId,
      'rating': rating,
      'review': review,
      'createdAt': DateTime.now().toIso8601String(),
    });
    
    // Update worker's average rating
    await _updateWorkerRating(workerId);
  }
  
  Future<void> _updateWorkerRating(String workerId) async {
    final ratings = await _db.collection('ratings')
        .where('workerId', isEqualTo: workerId)
        .get();
    
    if (ratings.docs.isEmpty) return;
    
    double totalRating = 0;
    for (var doc in ratings.docs) {
      totalRating += (doc.data()['rating'] ?? 0.0);
    }
    
    final avgRating = totalRating / ratings.docs.length;
    
    await _db.collection('workers').doc(workerId).update({
      'rating': avgRating,
    });
  }
  
  // Helper function to calculate distance between two coordinates
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // km
    
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);
    
    final a = (dLat / 2).sin() * (dLat / 2).sin() +
        (lat1 * (3.14159 / 180)).cos() * (lat2 * (3.14159 / 180)).cos() *
        (dLon / 2).sin() * (dLon / 2).sin();
    
    final c = 2 * (a.sqrt()).asin();
    
    return earthRadius * c;
  }
  
  double _degreesToRadians(double degrees) {
    return degrees * (3.14159 / 180);
  }
}