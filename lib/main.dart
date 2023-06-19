import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_converter/currency_converter/bloc/converter_bloc.dart';
import 'package:flutter_currency_converter/currency_converter/repository/currency_repository.dart';
import 'package:flutter_currency_converter/currency_converter/views/currency_converter.dart';
import 'package:flutter_currency_converter/theme/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Currency Converter',
            theme: ThemeData(
              primarySwatch: state.toggle ? Colors.yellow : Colors.blue,
            ),
            home: RepositoryProvider(
              create: (context) => CurrencyRepository(),
              child: BlocProvider(
                create: (context) => ConverterBloc(
                  currencyRepository: context.read<CurrencyRepository>(),
                ),
                child: const CurrencyConverter(),
              ),
            ),
          );
        },
      ),
    );
  }
}
