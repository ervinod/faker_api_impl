import 'package:faker_api_impl/features/home/presentation/blocs/user_bloc.dart';
import 'package:faker_api_impl/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/header.dart';
import '../widgets/user_list_view.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late UserBloc bloc;

  @override
  void initState() {
    /// user list api call
    bloc = sl<UserBloc>()..add(const GetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: const Column(
            children: [
              Header(
                key: Key("header"),
              ),
              Expanded(
                child: UserListView(
                  key: Key("userListView"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
