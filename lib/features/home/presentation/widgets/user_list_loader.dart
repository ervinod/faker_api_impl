import 'package:faker_api_impl/core/utils/util.dart';
import 'package:faker_api_impl/features/home/presentation/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListLoader extends StatelessWidget {
  const UserListLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ShimmerContainer(
          width: Utils.getScreenWidth(context),
          height: 80,
          borderRadius: BorderRadius.circular(10.r),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 14.h);
      },
      itemCount: 10,
    );
  }
}
