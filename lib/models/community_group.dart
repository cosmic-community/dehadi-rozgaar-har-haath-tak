class CommunityGroup {
  final String id;
  final String nameEnglish;
  final String nameHindi;
  final String category;
  final String descriptionEnglish;
  final String descriptionHindi;
  final String verificationStatus;
  final int memberCount;

  CommunityGroup({
    required this.id,
    required this.nameEnglish,
    required this.nameHindi,
    required this.category,
    required this.descriptionEnglish,
    required this.descriptionHindi,
    required this.verificationStatus,
    required this.memberCount,
  });

  factory CommunityGroup.fromJson(Map<String, dynamic> json) {
    final metadata = json['metadata'] ?? {};
    
    return CommunityGroup(
      id: json['id'] ?? '',
      nameEnglish: metadata['name_english'] ?? '',
      nameHindi: metadata['name_hindi'] ?? '',
      category: metadata['category'] ?? '',
      descriptionEnglish: metadata['description_english'] ?? '',
      descriptionHindi: metadata['description_hindi'] ?? '',
      verificationStatus: metadata['verification_status'] ?? 'Pending',
      memberCount: metadata['member_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'metadata': {
        'name_english': nameEnglish,
        'name_hindi': nameHindi,
        'category': category,
        'description_english': descriptionEnglish,
        'description_hindi': descriptionHindi,
        'verification_status': verificationStatus,
        'member_count': memberCount,
      },
    };
  }

  String getName(String languageCode) {
    return languageCode == 'hi' ? nameHindi : nameEnglish;
  }

  String getDescription(String languageCode) {
    return languageCode == 'hi' ? descriptionHindi : descriptionEnglish;
  }

  bool get isVerified => verificationStatus == 'Verified';
}