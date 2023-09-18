import '../base/base_entity.dart';

class Course extends BaseEntity {
  final String id;
  final String title;
  final String instructor;
  final String coverImage;
  final String description;
  final int primaryCoins;
  final int? secondaryCoins;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.coverImage,
    required this.description,
    required this.primaryCoins,
    this.secondaryCoins,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      instructor,
      coverImage,
      description,
      primaryCoins,
      secondaryCoins,
    ];
  }

  Course copyWith({
    String? id,
    String? title,
    String? instructor,
    String? coverImage,
    String? description,
    int? primaryCoins,
    int? secondaryCoins,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      coverImage: coverImage ?? this.coverImage,
      description: description ?? this.description,
      primaryCoins: primaryCoins ?? this.primaryCoins,
      secondaryCoins: secondaryCoins ?? this.secondaryCoins,
    );
  }
}
