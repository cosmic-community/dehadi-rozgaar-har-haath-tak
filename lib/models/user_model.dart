class UserModel {
  final String uid;
  final String phoneNumber;
  final String aadhaarNumber;
  final String role; // 'worker' or 'employer'
  final String? fcmToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.aadhaarNumber,
    required this.role,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      aadhaarNumber: json['aadhaarNumber'] ?? '',
      role: json['role'] ?? '',
      fcmToken: json['fcmToken'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'aadhaarNumber': aadhaarNumber,
      'role': role,
      'fcmToken': fcmToken,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? uid,
    String? phoneNumber,
    String? aadhaarNumber,
    String? role,
    String? fcmToken,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
      role: role ?? this.role,
      fcmToken: fcmToken ?? this.fcmToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}