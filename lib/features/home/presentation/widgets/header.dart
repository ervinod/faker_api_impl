import 'package:faker_api_impl/core/constants/string_constants.dart';
import 'package:faker_api_impl/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringConstants.ALL_USERS,
            style: StyleConstants.s28_w500_000000,
          ),
        ],
      ),
    );
  }
}
