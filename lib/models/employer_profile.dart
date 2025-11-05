class EmployerProfile {
  final String uid;
  final String name;
  final String phoneNumber;
  final String? companyName;
  final String address;
  final double latitude;
  final double longitude;
  final String? profileImage;
  final double rating;
  final int postedJobs;
  final DateTime createdAt;
  final DateTime updatedAt;

  EmployerProfile({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    this.companyName,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.profileImage,
    this.rating = 0.0,
    this.postedJobs = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EmployerProfile.fromJson(Map<String, dynamic> json) {
    return EmployerProfile(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      companyName: json['companyName'],
      address: json['address'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      profileImage: json['profileImage'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      postedJobs: json['postedJobs'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'companyName': companyName,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'profileImage': profileImage,
      'rating': rating,
      'postedJobs': postedJobs,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  EmployerProfile copyWith({
    String? uid,
    String? name,
    String? phoneNumber,
    String? companyName,
    String? address,
    double? latitude,
    double? longitude,
    String? profileImage,
    double? rating,
    int? postedJobs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmployerProfile(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      profileImage: profileImage ?? this.profileImage,
      rating: rating ?? this.rating,
      postedJobs: postedJobs ?? this.postedJobs,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}