import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:faker_api_impl/core/constants/color_constants.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String errorText;

  const RetryWidget({
    Key? key,
    required this.onRetry,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => onRetry(),
            child: Icon(
              Icons.refresh,
              size: 40.w,
            ),
          ),
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              color: ColorConstants.COLOR_RED,
            ),
          ),
        ],
      ),
    );
  }
}
