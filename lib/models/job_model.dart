class JobModel {
  final String jobId;
  final String employerId;
  final String employerName;
  final String employerPhone;
  final String workType;
  final int workersNeeded;
  final int durationDays;
  final int offeredWage;
  final String workLocation;
  final double latitude;
  final double longitude;
  final String description;
  final String status; // 'active', 'closed', 'completed'
  final bool isCommunityGroup;
  final String? communityGroupType;
  final int applicantsCount;
  final DateTime postedAt;
  final DateTime? closedAt;

  JobModel({
    required this.jobId,
    required this.employerId,
    required this.employerName,
    required this.employerPhone,
    required this.workType,
    required this.workersNeeded,
    required this.durationDays,
    required this.offeredWage,
    required this.workLocation,
    required this.latitude,
    required this.longitude,
    required this.description,
    this.status = 'active',
    this.isCommunityGroup = false,
    this.communityGroupType,
    this.applicantsCount = 0,
    required this.postedAt,
    this.closedAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobId: json['jobId'] ?? '',
      employerId: json['employerId'] ?? '',
      employerName: json['employerName'] ?? '',
      employerPhone: json['employerPhone'] ?? '',
      workType: json['workType'] ?? '',
      workersNeeded: json['workersNeeded'] ?? 1,
      durationDays: json['durationDays'] ?? 1,
      offeredWage: json['offeredWage'] ?? 0,
      workLocation: json['workLocation'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      status: json['status'] ?? 'active',
      isCommunityGroup: json['isCommunityGroup'] ?? false,
      communityGroupType: json['communityGroupType'],
      applicantsCount: json['applicantsCount'] ?? 0,
      postedAt: DateTime.parse(json['postedAt']),
      closedAt: json['closedAt'] != null ? DateTime.parse(json['closedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'employerId': employerId,
      'employerName': employerName,
      'employerPhone': employerPhone,
      'workType': workType,
      'workersNeeded': workersNeeded,
      'durationDays': durationDays,
      'offeredWage': offeredWage,
      'workLocation': workLocation,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'status': status,
      'isCommunityGroup': isCommunityGroup,
      'communityGroupType': communityGroupType,
      'applicantsCount': applicantsCount,
      'postedAt': postedAt.toIso8601String(),
      'closedAt': closedAt?.toIso8601String(),
    };
  }

  JobModel copyWith({
    String? jobId,
    String? employerId,
    String? employerName,
    String? employerPhone,
    String? workType,
    int? workersNeeded,
    int? durationDays,
    int? offeredWage,
    String? workLocation,
    double? latitude,
    double? longitude,
    String? description,
    String? status,
    bool? isCommunityGroup,
    String? communityGroupType,
    int? applicantsCount,
    DateTime? postedAt,
    DateTime? closedAt,
  }) {
    return JobModel(
      jobId: jobId ?? this.jobId,
      employerId: employerId ?? this.employerId,
      employerName: employerName ?? this.employerName,
      employerPhone: employerPhone ?? this.employerPhone,
      workType: workType ?? this.workType,
      workersNeeded: workersNeeded ?? this.workersNeeded,
      durationDays: durationDays ?? this.durationDays,
      offeredWage: offeredWage ?? this.offeredWage,
      workLocation: workLocation ?? this.workLocation,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      status: status ?? this.status,
      isCommunityGroup: isCommunityGroup ?? this.isCommunityGroup,
      communityGroupType: communityGroupType ?? this.communityGroupType,
      applicantsCount: applicantsCount ?? this.applicantsCount,
      postedAt: postedAt ?? this.postedAt,
      closedAt: closedAt ?? this.closedAt,
    );
  }
}