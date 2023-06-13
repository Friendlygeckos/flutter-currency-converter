import 'dart:convert';

import 'package:flutter_currency_converter/service/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyRepository {
  Future<CurrencyModel> fetchCurrencyInformation() async {
    var response = await http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/usd/jpy.json'));
    return CurrencyModel.fromJson(jsonDecode(response.body));
  }
}