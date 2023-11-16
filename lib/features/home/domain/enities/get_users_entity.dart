import 'package:equatable/equatable.dart';
import 'package:faker_api_impl/features/home/data/models/user_model.dart';


class GetUsersEntity extends Equatable {
  final List<User> usersEntity;

  const GetUsersEntity({
    required this.usersEntity,
  });

  GetUsersEntity copyWith({
    required List<User>? usersEntity,
  }) {
    return GetUsersEntity(
      usersEntity: usersEntity ?? this.usersEntity,
    );
  }

  @override
  List<Object?> get props => [usersEntity];
}
