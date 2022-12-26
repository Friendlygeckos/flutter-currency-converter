import 'package:json_annotation/json_annotation.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  final DateTime date;
  final double price;

  const CurrencyModel({required this.date, required this.price});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
