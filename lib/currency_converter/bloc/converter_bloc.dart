import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_currency_converter/currency_converter/models/currency_model.dart';
import 'package:flutter_currency_converter/service/enums/bloc_status.dart';
import 'package:flutter_currency_converter/currency_converter/repository/currency_repository.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc({required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(ConverterState.initial()) {
    on<FetchCurrencyInformation>(_fetchCurrencyInformation);
    on<InputAmount>(_inputAmount);
    on<UpdateSelectedCurrency>(_updateSelectedCurrency);

    add(FetchCurrencyInformation());
  }

  final CurrencyRepository _currencyRepository;

  Future<void> _fetchCurrencyInformation(
    FetchCurrencyInformation event,
    Emitter<ConverterState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final currencyModel = await _currencyRepository.fetchCurrencyInformation(
        fromCurrency: state.fromCurrency,
      );
      emit(
        state.copyWith(
          currencyModel: currencyModel,
          availableCurrencies: currencyModel.usd.keys.toList(),
          status: BlocStatus.success,
        ),
      );
    } catch (e) {
      debugPrint('error -> $e');
      emit(state.copyWith(status: BlocStatus.noData));
    }
  }

  Future<void> _inputAmount(
    InputAmount event,
    Emitter<ConverterState> emit,
  ) async {
    final input = event.amount;
    final parsedInput = input.isEmpty ? 0.0 : double.parse(input);
    final conversionRate = event.conversionRate;
    final convertedAmount = parsedInput * conversionRate;
    emit(
      state.copyWith(
        status: BlocStatus.success,
        convertedAmount: convertedAmount,
      ),
    );
  }

  Future<void> _updateSelectedCurrency(
    UpdateSelectedCurrency event,
    Emitter<ConverterState> emit,
  ) async {
    final selectedCurrency = event.selectedCurrency;
    emit(state.copyWith(toCurrency: selectedCurrency));
  }
}
