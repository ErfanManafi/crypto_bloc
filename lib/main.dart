import 'package:crypto_test/bloc/crypto_bloc.dart';
import 'package:crypto_test/repository/repo.dart';
import 'package:crypto_test/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Tracker',
      home: BlocProvider(
        create: (context) =>
            CryptoBloc(CryptoRepository())..add(FetchCryptoData()),
        child: const CryptoScreen(),
      ),
    );
  }
}
