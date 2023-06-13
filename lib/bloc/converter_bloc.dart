import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_currency_converter/service/enums/bloc_status.dart';
import 'package:flutter_currency_converter/service/models/currency_model.dart';
import 'package:flutter_currency_converter/service/repository/currency_repository.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc({required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(ConverterState.empty()) {
    on<FetchCurrencyInformation>(_fetchCurrencyInformation);
    on<InputAmount>(_inputAmount);
  }

  final CurrencyRepository _currencyRepository;

  Future<void> _fetchCurrencyInformation(
      FetchCurrencyInformation event, Emitter<ConverterState> emit) async {}

  Future<void> _inputAmount(
      InputAmount event, Emitter<ConverterState> emit) async {
    final input = event.amount;
    try {
      final response = await _currencyRepository.fetchCurrencyInformation();
      final convertedAmount = input * response.price;
      emit(
        state.copyWith(
            status: BlocStatus.success, convertedAmount: convertedAmount),
      );
    } catch (e) {
      emit(
        state.copyWith(status: BlocStatus.noData, convertedAmount: 0.0),
      );
    }
  }
}
