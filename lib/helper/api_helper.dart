import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/crypto_modal.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();
  Future<List<CryptocurrencyModel>?> cryptoApiHelper() async {
    log("Code is started...");
    Uri url = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd");
    http.Response res = await http.get(url);

    log("Response code : ${res.statusCode}");

    if (res.statusCode == 200) {
      log("If is run....");
      List apiData = jsonDecode(res.body);

      List<CryptocurrencyModel> allcryptoList = apiData
          .map(
            (e) => CryptocurrencyModel.fromJson(json: e),
          )
          .toList();

      return allcryptoList;
    }
    return null;
  }
}
