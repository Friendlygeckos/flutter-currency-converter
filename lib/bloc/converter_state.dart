part of 'converter_bloc.dart';

class ConverterState extends Equatable {
  ConverterState.initial()
      : currencyModel = CurrencyModel(date: DateTime.now(), price: 0.0),
        input = 0.0,
        convertedAmount = 0.0,
        fromCurrency = 'usd',
        toCurrency = 'jpy',
        status = BlocStatus.initial;

  const ConverterState({
    required this.currencyModel,
    required this.input,
    required this.status,
    required this.fromCurrency,
    required this.toCurrency,
    required this.convertedAmount,
  });

  final CurrencyModel currencyModel;
  final double input;
  final double convertedAmount;
  final String fromCurrency;
  final String toCurrency;
  final BlocStatus status;



  ConverterState copyWith({
    CurrencyModel? currencyModel,
    double? input,
    double? convertedAmount,
    String? fromCurrency,
    String? toCurrency,
    BlocStatus? status,
  }) {
    return ConverterState(
      currencyModel: currencyModel ?? this.currencyModel,
      input: input ?? this.input,
      convertedAmount: convertedAmount ?? this.convertedAmount,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        currencyModel,
        input,
        convertedAmount,
        fromCurrency,
        toCurrency,
        status,
      ];
}
