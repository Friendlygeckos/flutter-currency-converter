import 'package:json_annotation/json_annotation.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  final DateTime date;
  final Map<String, double> usd;

  const CurrencyModel({required this.date, required this.usd});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
