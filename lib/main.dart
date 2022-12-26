import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_converter/service/repository/currency_repository.dart';
import 'package:flutter_currency_converter/views/currency_converter.dart';

import 'bloc/converter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  }
}
