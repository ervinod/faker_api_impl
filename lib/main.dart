import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:faker_api_impl/core/constants/string_constants.dart';
import 'package:faker_api_impl/core/constants/value_constants.dart';
import 'package:faker_api_impl/features/home/presentation/blocs/user_bloc.dart';
import 'package:faker_api_impl/features/home/presentation/pages/home_page.dart';
import 'package:faker_api_impl/injection_container.dart';

import 'app_bloc_observer.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  /// injecting dependencies
  await di.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => sl<UserBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          ValueConstants.BASE_SCREEN_WIDTH,
          ValueConstants.BASE_SCREEN_HEIGHT,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: StringConstants.ALL_USERS,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.grey,
            ),
            home: const UserListPage(
              key: Key("userListPage"),
            ),
          );
        },
      ),
    );
  }
}
