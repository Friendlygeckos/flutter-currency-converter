part of 'converter_bloc.dart';

class ConverterState extends Equatable {
  ConverterState.empty()
      : currencyModel = CurrencyModel(date: DateTime.now(), price: 0.0),
        input = 0.0,
        convertedAmount = 0.0,
        status = BlocStatus.initial;

  final CurrencyModel currencyModel;
  final double input;
  final double convertedAmount;
  final BlocStatus status;

  const ConverterState({
    required this.currencyModel,
    required this.input,
    required this.status,
    required this.convertedAmount,
  });

  ConverterState copyWith({
    CurrencyModel? currencyModel,
    double? input,
    double? convertedAmount,
    BlocStatus? status,
  }) {
    return ConverterState(
      currencyModel: currencyModel ?? this.currencyModel,
      input: input ?? this.input,
      convertedAmount: convertedAmount ?? this.convertedAmount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [currencyModel, input, convertedAmount, status];
}
