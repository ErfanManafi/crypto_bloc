import 'dart:convert';
import 'dart:async';
import 'package:crypto_test/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoRepository {
  final String apiUrl;

  CryptoRepository(
      {this.apiUrl =
          "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD,EUR"});

  Future<CryptoData> fetchCryptoData() async {
    try {
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return CryptoData.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            'Failed to load crypto data: ${response.statusCode} ${response.reasonPhrase}');
      }
    } on TimeoutException catch (_) {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
