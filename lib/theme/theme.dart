import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant_strings.dart';

final appThemeData = ThemeData(
  fontFamily: Constant.fonts.nexa,
  colorScheme: lightColorScheme,
  primaryColor: lightColorScheme.primary,
  primaryColorLight: lightColorScheme.primaryContainer,
  textTheme: TextTheme(
    displayMedium: TextStyle(
      color: lightColorScheme.primary,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: lightColorScheme.primary,
      fontWeight: FontWeight.bold,
      fontSize: 26.sp,
    ),
    headlineLarge: TextStyle(
      fontFamily: Constant.fonts.nexaBold,
      color: lightColorScheme.primary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500),
    headlineMedium: TextStyle(
      fontSize: 22.sp,
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
    ),
    titleMedium: TextStyle(
      fontSize: 20.0.sp,
      letterSpacing: 1.3,
      wordSpacing: 1.3,
      height: 2,
    ),
    titleSmall: TextStyle(
      fontSize: 18.0.sp,
      wordSpacing: 1.3,
      height: 2,
    ),
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(fontSize: 18.sp),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 18.sp,
    ),
    errorStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.error,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(25.0),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 4.0.h),
    alignLabelWithHint: true,
    isDense: true,
    isCollapsed: true,
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  ),
  disabledColor: Colors.grey,
  dividerColor: lightColorScheme.primary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF315DA8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD8E2FF),
  onPrimaryContainer: Color(0xFF001A41),
  secondary: Color(0xFF006685),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFBFE9FF),
  onSecondaryContainer: Color(0xFF001F2A),
  tertiary: Color(0xFF006876),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF9EEFFF),
  onTertiaryContainer: Color(0xFF001F24),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF2FFFD),
  onBackground: Color(0xFF00201E),
  surface: Color(0xFFF2FFFD),
  onSurface: Color(0xFF00201E),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF44474F),
  outline: Color(0xFF74777F),
  onInverseSurface: Color(0xFFB1FFF8),
  inverseSurface: Color(0xFF003734),
  inversePrimary: Color(0xFFADC6FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF315DA8),
  outlineVariant: Color(0xFFC4C6D0),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFADC6FF),
  onPrimary: Color(0xFF002E69),
  primaryContainer: Color(0xFF0F448E),
  onPrimaryContainer: Color(0xFFD8E2FF),
  secondary: Color(0xFF6DD2FF),
  onSecondary: Color(0xFF003547),
  secondaryContainer: Color(0xFF004D65),
  onSecondaryContainer: Color(0xFFBFE9FF),
  tertiary: Color(0xFF51D7EE),
  onTertiary: Color(0xFF00363E),
  tertiaryContainer: Color(0xFF004E59),
  onTertiaryContainer: Color(0xFF9EEFFF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF00201E),
  onBackground: Color(0xFF70F7EE),
  surface: Color(0xFF00201E),
  onSurface: Color(0xFF70F7EE),
  surfaceVariant: Color(0xFF44474F),
  onSurfaceVariant: Color(0xFFC4C6D0),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF00201E),
  inverseSurface: Color(0xFF70F7EE),
  inversePrimary: Color(0xFF315DA8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFADC6FF),
  outlineVariant: Color(0xFF44474F),
  scrim: Color(0xFF000000),
);