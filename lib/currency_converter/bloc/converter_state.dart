part of 'converter_bloc.dart';

class ConverterState extends Equatable {
  ConverterState.initial()
      : currencyModel = CurrencyModel(date: DateTime.now(), usd: {}),
        input = 0.0,
        convertedAmount = 0.0,
        fromCurrency = 'usd',
        toCurrency = 'jpy',
        availableCurrencies = const [],
        status = BlocStatus.initial;

  const ConverterState({
    required this.currencyModel,
    required this.input,
    required this.status,
    required this.fromCurrency,
    required this.toCurrency,
    required this.convertedAmount,
    required this.availableCurrencies,
  });

  final CurrencyModel currencyModel;
  final double input;
  final double convertedAmount;
  final String fromCurrency;
  final String toCurrency;
  final BlocStatus status;
  final List<String> availableCurrencies;

  ConverterState copyWith({
    CurrencyModel? currencyModel,
    double? input,
    double? convertedAmount,
    String? fromCurrency,
    String? toCurrency,
    BlocStatus? status,
    List<String>? availableCurrencies,
  }) {
    return ConverterState(
      currencyModel: currencyModel ?? this.currencyModel,
      input: input ?? this.input,
      convertedAmount: convertedAmount ?? this.convertedAmount,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      status: status ?? this.status,
      availableCurrencies: availableCurrencies ?? this.availableCurrencies,
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
        availableCurrencies,
      ];
}
