import 'package:crypto_test/bloc/crypto_bloc.dart';
import 'package:crypto_test/components/text_style.dart';
import 'package:crypto_test/resources/colors.dart';
import 'package:crypto_test/widgets/crypto_info_list.dart';
import 'package:crypto_test/widgets/image_container.dart';
import 'package:crypto_test/widgets/loading.dart';
import 'package:crypto_test/widgets/wallet_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          if (state is CryptoInitial) {
            return const Center(
                child: Text(
              '...لطفا صبر کنید',
              style: AppTextStyle.title,
            ));
          } else if (state is CryptoLoading) {
            return const Center(child: Loading());
          } else if (state is CryptoLoaded) {
            final cryptos = state.cryptoData.cryptos.entries.toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShieldImageContainer(size: size),
                  WalletContainers(size: size),
                  const SizedBox(height: 50),
                  CryptoList(cryptos: cryptos),
                ],
              ),
            );
          } else if (state is CryptoError) {
            return Center(
                child: Text(
              state.message,
              style: AppTextStyle.title,
            ));
          } else {
            return const Center(
                child: Text(
              'خطای نامشخص',
              style: AppTextStyle.title,
            ));
          }
        },
      ),
    );
  }
}
