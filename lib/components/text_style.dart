import 'package:crypto_test/resources/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Dana',
    fontSize: 12,
    color: AppColors.title,
  );
  static const TextStyle title = TextStyle(
      fontFamily: 'Dana',
      fontSize: 15,
      color: AppColors.title,
      fontWeight: FontWeight.bold);
}
