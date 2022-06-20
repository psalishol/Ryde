import 'package:flutter/material.dart';

import 'color.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.purple,
      fontFamily: 'Poppins',
      textTheme: textTheme());
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        color: AppColors.black, fontSize: 32, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: AppColors.black, fontSize: 24, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: AppColors.black, fontSize: 12, fontWeight: FontWeight.bold),
    // caption: TextStyle(
    // color: AppColors.grey, fontSize: 10, fontWeight: FontWeight.normal)
  );
}
