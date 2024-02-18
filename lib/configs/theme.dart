import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppColor {
  primary(Color(0xFF5F939A)),
  secondary(Color(0xFF3A6351)),
  text(Color(0xFFA0937D)),
  pure(Color(0xFFF2EDD7));

  const AppColor(this.value);

  final Color value;
}

ThemeData defaultThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: AppColor.primary.value,
    seedColor: AppColor.primary.value,
    secondary: AppColor.secondary.value,
    surfaceTint: Colors.transparent,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  canvasColor: Colors.transparent,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      minimumSize: Size.zero,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(
        width: 1.0,
        color: AppColor.secondary.value,
      ),
      textStyle: TextStyle(
        fontSize: 18,
        color: AppColor.pure.value,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primary.value,
    textTheme: const CupertinoTextThemeData(),
  ),
);
