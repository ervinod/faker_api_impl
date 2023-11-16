import 'package:faker_api_impl/features/home/data/models/user_model.dart';
import 'package:faker_api_impl/features/home/domain/enities/get_users_entity.dart';

class UserResponseModel extends GetUsersEntity {
  final String status;
  final int code;
  final int total;
  final List<User> users;

  const UserResponseModel({
    required this.status,
    required this.code,
    required this.total,
    required this.users,
  }) : super(usersEntity: users);

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      status: json["status"] ?? '',
      code: json["code"] ?? 200,
      total: json["total"] ?? 0,
      users: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    );
  }
}