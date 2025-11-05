class WorkerProfile {
  final String uid;
  final String name;
  final String phoneNumber;
  final String workType;
  final int expectedWage;
  final int experienceYears;
  final String address;
  final double latitude;
  final double longitude;
  final String? profileImage;
  final double rating;
  final int completedJobs;
  final List<String> skills;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;

  WorkerProfile({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.workType,
    required this.expectedWage,
    required this.experienceYears,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.profileImage,
    this.rating = 0.0,
    this.completedJobs = 0,
    this.skills = const [],
    this.isAvailable = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkerProfile.fromJson(Map<String, dynamic> json) {
    return WorkerProfile(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      workType: json['workType'] ?? '',
      expectedWage: json['expectedWage'] ?? 0,
      experienceYears: json['experienceYears'] ?? 0,
      address: json['address'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      profileImage: json['profileImage'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      completedJobs: json['completedJobs'] ?? 0,
      skills: List<String>.from(json['skills'] ?? []),
      isAvailable: json['isAvailable'] ?? true,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'workType': workType,
      'expectedWage': expectedWage,
      'experienceYears': experienceYears,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'profileImage': profileImage,
      'rating': rating,
      'completedJobs': completedJobs,
      'skills': skills,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  WorkerProfile copyWith({
    String? uid,
    String? name,
    String? phoneNumber,
    String? workType,
    int? expectedWage,
    int? experienceYears,
    String? address,
    double? latitude,
    double? longitude,
    String? profileImage,
    double? rating,
    int? completedJobs,
    List<String>? skills,
    bool? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WorkerProfile(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workType: workType ?? this.workType,
      expectedWage: expectedWage ?? this.expectedWage,
      experienceYears: experienceYears ?? this.experienceYears,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      profileImage: profileImage ?? this.profileImage,
      rating: rating ?? this.rating,
      completedJobs: completedJobs ?? this.completedJobs,
      skills: skills ?? this.skills,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}