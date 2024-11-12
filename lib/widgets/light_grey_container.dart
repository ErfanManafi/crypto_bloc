import 'package:crypto_test/components/text_style.dart';
import 'package:crypto_test/resources/colors.dart';
import 'package:flutter/material.dart';

class CryptoInfoContainer extends StatelessWidget {
  final String title;

  const CryptoInfoContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      width: MediaQuery.of(context).size.width / 2 - 35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
                color: AppColors.plusIcon,
                borderRadius: BorderRadius.all(Radius.circular(1000))),
            child: const Icon(
              size: 20,
              Icons.add,
              color: AppColors.iconColor,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: AppTextStyle.subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
