import 'package:faker_api_impl/core/constants/color_constants.dart';
import 'package:faker_api_impl/core/constants/string_constants.dart';
import 'package:faker_api_impl/core/constants/style_constants.dart';
import 'package:faker_api_impl/core/constants/value_constants.dart';
import 'package:faker_api_impl/features/home/data/models/user_model.dart';
import 'package:faker_api_impl/features/home/presentation/blocs/user_bloc.dart';
import 'package:faker_api_impl/features/home/presentation/widgets/error_widget.dart';
import 'package:faker_api_impl/features/home/presentation/widgets/user_item.dart';
import 'package:faker_api_impl/features/home/presentation/widgets/user_list_loader.dart';
import 'package:faker_api_impl/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  List<User> users = [];
  late UserBloc bloc;
  bool bIsPaginating = false;
  late ScrollController scrollController;
  int userTotal = 30;

  @override
  void initState() {
    bloc = sl<UserBloc>();
    scrollController = ScrollController();
    /// attach scroll listener to listen scrolling
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    if (scrollController.hasClients &&
        !bIsPaginating &&
        (scrollController.position.pixels == scrollController.position.maxScrollExtent)) {
      if (users.length < userTotal) {
        /// check for pagination
        bloc = sl<UserBloc>()..add(const GetUsersEvent(isInitial: false));
      }
    }
  }

  @override
  void dispose() {
    /// removing scroll listener
    scrollController.removeListener(scrollListener);
    /// dispose scroll controller in order to avoid memory leak
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is GetUsersState) {
          if (state.status == ApiStatus.loading) {
            if (!state.isInitial) {
              bIsPaginating = true;
            } else {
              users.clear();
            }
          } else if (state.status == ApiStatus.loaded) {
            users.addAll(state.users);
            if (!state.isInitial) {
              bIsPaginating = false;
            }
          }
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetUsersState && state.status == ApiStatus.loading && !bIsPaginating) {
            return const UserListLoader();
          }

          if (state is GetUsersState && state.status == ApiStatus.error) {
            return RetryWidget(
              onRetry: () {
                bloc.add(const GetUsersEvent());
              },
              errorText: state.error,
            );
          }
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(milliseconds: 600)).then((value) {
                bloc = sl<UserBloc>()..add(const GetUsersEvent());
              });
            },
            child: users.isNotEmpty
                ? ListView.separated(
                    primary: false,
                    //shrinkWrap: true,
                    itemCount: users.length + 1,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    controller: scrollController,
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: const Divider(color: Colors.grey),
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      if (index == users.length) {
                        return Center(
                          child: users.length >= userTotal
                              ? Text(StringConstants.ALL_DATA_LOADED)
                              : const CircularProgressIndicator(
                            color: ColorConstants.COLOR_BLACK,
                          ),
                        );
                      }
                      return UserItem(
                        key: Key("userItem$index"),
                        item: users[index],
                      );
                    },
                  )
                : Center(
                    child: Text(
                      StringConstants.NO_DATA_FOUND,
                      style: StyleConstants.s18_w400_000000,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
