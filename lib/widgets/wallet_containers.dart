import 'package:crypto_test/components/text_style.dart';
import 'package:crypto_test/resources/colors.dart';
import 'package:crypto_test/resources/strings.dart';
import 'package:crypto_test/widgets/light_grey_container.dart';
import 'package:flutter/material.dart';

class WalletContainers extends StatelessWidget {
  const WalletContainers({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SizedBox(
        height: size.height / 5.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const CryptoInfoContainer(
                  title: AppStrings.createSmartWallet,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.haveWallet,
                  style: AppTextStyle.subtitle.copyWith(
                      decorationColor: Colors.white,
                      decorationThickness: 1.5,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
            Container(
              height: size.height / 5.7,
              width: 1,
              color: AppColors.dividerColor,
            ),
            Column(
              children: [
                const CryptoInfoContainer(
                  title: AppStrings.createPrivateWallet,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.walletRecovery,
                  style: AppTextStyle.subtitle.copyWith(
                      decorationColor: Colors.white,
                      decorationThickness: 1.5,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
