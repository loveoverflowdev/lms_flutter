import '../../base/base_entity.dart';

abstract class User extends BaseEntity {
  final String id;
  final String username;
  final String? password;

  User({
    required this.id,
    required this.username,
    this.password,
  });
}
