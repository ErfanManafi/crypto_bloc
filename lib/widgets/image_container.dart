import 'package:crypto_test/resources/colors.dart';
import 'package:flutter/material.dart';

class ShieldImageContainer extends StatelessWidget {
  const ShieldImageContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.scaffoldBg,
          image:
              DecorationImage(image: AssetImage('assets/images/png/icon.png'))),
      height: size.height / 2.2,
      width: double.infinity,
    );
  }
}
