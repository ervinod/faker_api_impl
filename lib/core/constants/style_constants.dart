import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:faker_api_impl/core/constants/color_constants.dart';

class StyleConstants {
  static const String _fontFamily = '';

  static get s28_w500_000000 => TextStyle(
      fontSize: 28.sp,
      color: ColorConstants.COLOR_BLACK,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily);

  static get s30_w400_000000 => TextStyle(
      fontSize: 30.sp,
      color: ColorConstants.COLOR_BLACK,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily);

  static get s20_w400_D50000 => TextStyle(
      fontSize: 20.sp,
      color: ColorConstants.COLOR_RED,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily);

  static get s18_w400_000000 => TextStyle(
      fontSize: 18.sp,
      color: ColorConstants.COLOR_BLACK,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily);

  static get s15_w400_000000 => TextStyle(
      fontSize: 15.sp,
      color: ColorConstants.COLOR_BLACK.withOpacity(0.8),
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily);

  static get s15_w500_000000 => TextStyle(
      fontSize: 15.sp,
      color: ColorConstants.COLOR_BLACK.withOpacity(0.8),
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily);
}
