import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/api_client.dart';
import 'core/network/network_info.dart';
import 'features/home/data/datasources/get_users_datasource.dart';
import 'features/home/data/repositories/get_users_repository_impl.dart';
import 'features/home/domain/repositories/get_users_repository.dart';
import 'features/home/domain/usecases/get_users_usecase.dart';
import 'features/home/presentation/blocs/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => http.Client());

  usersInjection();
}

void usersInjection() {
  sl.registerLazySingleton(() => UserBloc(getUsersUseCase: sl()));

  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  sl.registerLazySingleton<GetUsersRepository>(
      () => GetUsersRepositoryImpl(networkInfo: sl(), getUsersDataSource: sl()));

  sl.registerLazySingleton<GetUsersDataSource>(
      () => GetUsersDataSourceImpl(client: sl()));
}
