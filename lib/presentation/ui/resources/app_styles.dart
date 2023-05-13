import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class Styles {
  static TextStyle getLogoTextStyle() => const TextStyle(
      fontSize: 38.0,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w800,
      fontFamily: 'MainFont');

  static TextStyle getTextActionStyles() => const TextStyle(
        fontSize: 18.0,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'MainFont',
      );

  static TextStyle getOnBoardingTitle() =>  TextStyle(
      fontSize: 26.0,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: 'MainFont');

  static TextStyle getOnBoardingSubTitle() => const TextStyle(
      fontSize: 18.0,
      color: AppColors.lightGray,
      fontWeight: FontWeight.w500,
      height: 1.4,
      fontFamily: 'MainFont');

  static TextStyle getTextNode() => const TextStyle(
        fontSize: 16.0,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle getNodeTitle() =>  TextStyle(
        color: AppColors.black,
        fontSize: 16,
        height: 1.4,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getLabelStyle() =>  TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontFamily: 'MainFont');

  static TextStyle getContentStyle() => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFFAAAAAA),
      fontFamily: 'MainFont');

  static TextStyle getPriceStyle() => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryColor,
      fontFamily: 'MainFont');
}
