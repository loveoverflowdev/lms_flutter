import 'package:lms_flutter/data/models/base/data_model.dart';

abstract class DataUser extends DataModel {
  final String id;
  final String username;
  final String? password;

  DataUser({
    required this.id,
    required this.username,
    this.password,
  });
}
