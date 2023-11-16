import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:faker_api_impl/core/constants/color_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerContainer(
      {Key? key,
      this.width = 100,
      this.height = 100,
      this.borderRadius,
      this.padding,
      this.margin,
      this.baseColor,
      this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? ColorConstants.COLOR_SHIMMER_BASE,
        highlightColor:
            highlightColor ?? ColorConstants.COLOR_SHIMMER_HIGHLIGHT,
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: ColorConstants.COLOR_WHITE,
          ),
        ),
      ),
    );
  }
}
