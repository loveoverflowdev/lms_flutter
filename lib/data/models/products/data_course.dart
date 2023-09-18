import 'package:lms_flutter/domain/entities/products/course.dart';

import '../base/data_model.dart';

class DataCourse extends DataModel {
  String? id;
  String? title;
  String? instructor;
  String? coverImage;
  String? description;
  int? primaryCoins;
  int? secondaryCoins;

  DataCourse({
    this.id,
    this.title,
    this.instructor,
    this.coverImage,
    this.description,
    this.primaryCoins,
    this.secondaryCoins,
  });

  DataCourse.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    instructor = json['instructor'];
    coverImage = json['coverImage'];
    description = json['description'];
    primaryCoins = json['primaryCoins'];
    secondaryCoins = json['secondaryCoins'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['instructor'] = instructor;
    data['coverImage'] = coverImage;
    data['description'] = description;
    data['primaryCoins'] = primaryCoins;
    data['secondaryCoins'] = secondaryCoins;
    return data;
  }

  @override
  Course toEntity() {
    return Course(
      id: id ?? '',
      title: title ?? '',
      instructor: instructor ?? '',
      coverImage: coverImage ?? '',
      description: description ?? '',
      primaryCoins: primaryCoins ?? 0,
      secondaryCoins: secondaryCoins,
    );
  }
}
