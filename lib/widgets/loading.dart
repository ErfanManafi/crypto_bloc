import 'package:crypto_test/resources/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double dimension =
        (size.width < size.height ? size.width : size.height) * 0.15;

    return SizedBox(
      height: dimension,
      width: dimension,
      child: const CircularProgressIndicator(
        color: AppColors.loading,
        strokeWidth: 3,
      ),
    );
  }
}
