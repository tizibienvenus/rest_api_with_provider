import 'package:rest_api_with_provider/config/constants/constants.dart';
import 'package:flutter/material.dart';

class LightThemeColors {
  static const Color kEasySliderBack = kWhiteColor;
  static const Color kMyRouteBorderColor = kBackColor;
  static const Color kDragHandleColor = Color(0xFFF2F2F2);
  static const Color kCancelButtonColor = kBackColor;
  static const Color kPayButton = kWhiteColor;
  static const Color kNextIcon = kWhiteColor;
  static const Color kIconButtonColor = kWhiteColor;
  static const Color kTextWithIconColor = kBlackColor;
  static const Color kRideCardColor = kBackColor;
  static const Color kInputColor = kBackColor;
}

class DarkThemeColors {
  static const Color kEasySliderBack = kContentColorLightTheme;
   static const Color kMyRouteBorderColor = kSecondDark;
  static const Color kDragHandleColor = kSecondDark;
  static Color kCancelButtonColor = kBackColor.withOpacity(0.02);
  static const Color kPayButton = kWhiteColor;
  static const Color kNextIcon = kWhiteColor;
  static const Color kIconButtonColor = kWhiteColor;
  static const Color kTextWithIconColor = kWhiteColor;
  static const Color kRideCardColor = kSecondDark;

}

class ThemeColors {
  final BuildContext context;

  ThemeColors(this.context);

  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  Color get kEasySliderBack => isLightMode ?  LightThemeColors.kEasySliderBack : DarkThemeColors.kEasySliderBack;

  Color get kCancelButtonColor => isLightMode ? LightThemeColors.kCancelButtonColor : DarkThemeColors.kCancelButtonColor;

  Color get kMyRouteBorderColor => isLightMode ? LightThemeColors.kMyRouteBorderColor : DarkThemeColors.kMyRouteBorderColor;

  Color get kDragHandleColor => isLightMode ? LightThemeColors.kDragHandleColor : DarkThemeColors.kDragHandleColor;

  Color get kTextWithIconColor => isLightMode ? LightThemeColors.kTextWithIconColor : DarkThemeColors.kTextWithIconColor;

  Color get kRideCardColor => isLightMode ? LightThemeColors.kRideCardColor : DarkThemeColors.kRideCardColor;

}

