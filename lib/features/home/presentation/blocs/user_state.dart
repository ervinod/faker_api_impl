part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState() : super();

  @override
  List<Object> get props => [];
}

class GetUsersState extends UserState {
  final List<User> users;
  final ApiStatus status;
  final String error;
  final bool isInitial;

  const GetUsersState({
    required this.users,
    required this.status,
    this.error = '',
    this.isInitial = true,
  });

  factory GetUsersState.initial() {
    return const GetUsersState(
      users: [],
      status: ApiStatus.initial,
    );
  }

  @override
  List<Object> get props => [isInitial, users, status, error];

  @override
  String toString() =>
      'GetUsersState(users: $users, status:$status, error:$error, isInitial: $isInitial)';

  GetUsersState copyWith({
    List<User>? users,
    ApiStatus? status,
    String? error,
    bool? isInitial,
  }) {
    return GetUsersState(
      users: users ?? this.users,
      status: status ?? this.status,
      error: error ?? this.error,
      isInitial: isInitial ?? this.isInitial,
    );
  }
}
