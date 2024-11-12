import 'package:crypto_test/components/text_style.dart';
import 'package:crypto_test/model/crypto_model.dart';
import 'package:crypto_test/resources/colors.dart';
import 'package:crypto_test/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({
    super.key,
    required this.cryptos,
  });

  final List<MapEntry<String, Crypto>> cryptos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            AppStrings.topCryptos,
            style: AppTextStyle.title,
          ),
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
          if (cryptos.isNotEmpty) ...[
            // Display BTC if available
            _buildCryptoRow('BTC', 'Bitcoin', 'assets/images/svg/bitcoin.svg'),
            const SizedBox(height: 15),
            // Display ETH if available
            _buildCryptoRow('ETH', 'Ether', 'assets/images/svg/ethereum.svg'),
          ],
        ],
      ),
    );
  }

  Widget _buildCryptoRow(String symbol, String name, String iconPath) {
    final cryptoEntry = cryptos.firstWhere(
      (entry) => entry.key == symbol,
      orElse: () => MapEntry(symbol, Crypto(usd: 0.0, eur: 0.0)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(iconPath),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name.toUpperCase(), style: AppTextStyle.title),
                  Text(
                    symbol,
                    style: AppTextStyle.title.copyWith(
                      color: const Color.fromARGB(144, 255, 255, 255),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${cryptoEntry.value.usd.toStringAsFixed(2)}',
                style: AppTextStyle.title.copyWith(color: AppColors.negative),
              ),
              Text(
                '€${cryptoEntry.value.eur.toStringAsFixed(2)}',
                style: AppTextStyle.title.copyWith(color: AppColors.positive),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
