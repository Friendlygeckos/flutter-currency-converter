import 'dart:convert';

import 'package:flutter_currency_converter/service/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyRepository {
  // final baseURL = 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest';

  Future<CurrencyModel> fetchCurrencyInformation() async {
    // const endpoint = '/currencies/usd/jpy.json';
    // var response = await http.get(Uri.parse(baseURL + endpoint));
    var response = await http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/usd/jpy.json'));
    print('api status -> ${response.statusCode}');
    print('response body -> ${response.body}');
    return CurrencyModel.fromJson(jsonDecode(response.body));
  }
}