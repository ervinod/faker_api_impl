part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UserEvent {
  final bool isInitial;

  const GetUsersEvent({ this.isInitial = true}) : super();

  @override
  String toString() => 'GetUsersEvent()';

  @override
  List<Object> get props => [isInitial];
}
