import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../enities/get_users_entity.dart';
import '../repositories/get_users_repository.dart';

class GetUserUseCase implements UseCase<GetUsersEntity, GetUsersParams> {
  final GetUsersRepository getUsersRepository;

  GetUserUseCase(this.getUsersRepository);

  @override
  Future<Either<Failure, GetUsersEntity>> call(GetUsersParams params) async {
    return await getUsersRepository.getUserList();
  }
}

class GetUsersParams extends Equatable {
  const GetUsersParams();

  @override
  List<Object> get props => [];
}
