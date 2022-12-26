part of 'converter_bloc.dart';

abstract class ConverterEvent extends Equatable {
  const ConverterEvent();

  @override
  List<Object?> get props => [];
}

class FetchCurrencyInformation extends ConverterEvent{}

class InputAmount extends ConverterEvent {
  final double amount;

  const InputAmount({required this.amount});

  @override
  List<Object?> get props => [amount];
}