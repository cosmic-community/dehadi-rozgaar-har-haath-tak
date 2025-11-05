class JobCategory {
  final String id;
  final String nameEnglish;
  final String nameHindi;
  final String icon;
  final String descriptionEnglish;
  final String descriptionHindi;

  JobCategory({
    required this.id,
    required this.nameEnglish,
    required this.nameHindi,
    required this.icon,
    required this.descriptionEnglish,
    required this.descriptionHindi,
  });

  factory JobCategory.fromJson(Map<String, dynamic> json) {
    final metadata = json['metadata'] ?? {};
    
    return JobCategory(
      id: json['id'] ?? '',
      nameEnglish: metadata['name_english'] ?? '',
      nameHindi: metadata['name_hindi'] ?? '',
      icon: metadata['icon'] ?? 'work',
      descriptionEnglish: metadata['description_english'] ?? '',
      descriptionHindi: metadata['description_hindi'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'metadata': {
        'name_english': nameEnglish,
        'name_hindi': nameHindi,
        'icon': icon,
        'description_english': descriptionEnglish,
        'description_hindi': descriptionHindi,
      },
    };
  }

  String getName(String languageCode) {
    return languageCode == 'hi' ? nameHindi : nameEnglish;
  }

  String getDescription(String languageCode) {
    return languageCode == 'hi' ? descriptionHindi : descriptionEnglish;
  }
}