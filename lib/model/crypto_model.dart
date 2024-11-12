class Crypto {
  double usd;
  double eur;

  Crypto({required this.usd, required this.eur});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      usd: json['USD']?.toDouble() ?? 0.0,
      eur: json['EUR']?.toDouble() ?? 0.0,
    );
  }

  void updatePrices(double newUsd, double newEur) {
    usd = newUsd;
    eur = newEur;
  }
}

class CryptoData {
  final Map<String, Crypto> cryptos;

  CryptoData({required this.cryptos});

  factory CryptoData.fromJson(Map<String, dynamic> json) {
    Map<String, Crypto> cryptos = {};
    json.forEach((key, value) {
      cryptos[key] = Crypto.fromJson(value);
    });
    return CryptoData(cryptos: cryptos);
  }
  // for later improvments
  Crypto? getCrypto(String symbol) {
    return cryptos[symbol.toUpperCase()];
  }

  void updateCryptoPrices(Map<String, dynamic> newPrices) {
    newPrices.forEach((symbol, data) {
      if (cryptos.containsKey(symbol)) {
        cryptos[symbol]?.updatePrices(data['USD'], data['EUR']);
      }
    });
  }
}
