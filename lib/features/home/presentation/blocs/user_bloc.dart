import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:faker_api_impl/features/home/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/value_constants.dart';
import '../../../../core/utils/util.dart';
import '../../domain/usecases/get_users_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, GetUsersState> {
  final GetUserUseCase getUsersUseCase;

  UserBloc({
    required this.getUsersUseCase,
  }) : super(GetUsersState.initial()) {
    on<GetUsersEvent>(_getUsers);
  }

  Future<void> _getUsers(GetUsersEvent event, Emitter<GetUsersState> emit) async {

    emit(state.copyWith(status: ApiStatus.loading, isInitial: event.isInitial));

    final response = await getUsersUseCase(const GetUsersParams());

    /// in order to show loading shimmer for extended time
    sleep(const Duration(milliseconds: 200));

    response.fold(
      (failure) {
        emit(state.copyWith(
            status: ApiStatus.error,
            error: Utils.mapFailureToMessage(failure),
            isInitial: event.isInitial));
      },
      (result) async {
        emit(state.copyWith(
          status: ApiStatus.loaded,
          users: result.usersEntity,
          isInitial: event.isInitial,
        ));
      },
    );
  }
}
