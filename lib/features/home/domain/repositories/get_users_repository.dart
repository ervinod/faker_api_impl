import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../enities/get_users_entity.dart';

abstract class GetUsersRepository {
  Future<Either<Failure, GetUsersEntity>> getUserList();
}
