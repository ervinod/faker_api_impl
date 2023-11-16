import 'package:dartz/dartz.dart';
import 'package:faker_api_impl/features/home/data/models/user_response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_users_repository.dart';
import '../datasources/get_users_datasource.dart';

class GetUsersRepositoryImpl implements GetUsersRepository {
  GetUsersRepositoryImpl({
    required this.getUsersDataSource,
    required this.networkInfo,
  });

  final GetUsersDataSource getUsersDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, UserResponseModel>> getUserList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await getUsersDataSource.getUserList();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      } on ApiException catch (e) {
        return Left(
          ApiFailure(message: e.message),
        );
      } on GeneralException {
        return Left(GeneralFailure());
      } on Exception {
        return Left(GeneralFailure());
      }
    } else {
      return Left(
        InternetFailure(),
      );
    }
  }
}
