part of 'converter_bloc.dart';

abstract class ConverterEvent extends Equatable {
  const ConverterEvent();

  @override
  List<Object?> get props => [];
}

class FetchCurrencyInformation extends ConverterEvent {}

class InputAmount extends ConverterEvent {
  final double amount;
  final double conversionRate;

  const InputAmount({
    required this.amount,
    required this.conversionRate,
  });

  @override
  List<Object?> get props => [
        amount,
        conversionRate,
      ];
}

class UpdateSelectedCurrency extends ConverterEvent {
  final String selectedCurrency;

  const UpdateSelectedCurrency({
    required this.selectedCurrency,
  });

  @override
  List<Object?> get props => [selectedCurrency];
}
