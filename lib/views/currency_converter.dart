import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_converter/bloc/converter_bloc.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _currencyInputController =
      TextEditingController();

  @override
  void dispose() {
    _currencyInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConverterBloc, ConverterState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final bloc = context.read<ConverterBloc>();
        final convertedAmount = state.convertedAmount;
        final currencyModel = state.currencyModel;
        final fromCurrency = state.fromCurrency;
        final toCurrency = state.toCurrency;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Currency Converter'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _currencyInputController,
                    onChanged: (value) {
                      bloc.add(
                        InputAmount(
                          amount: double.parse(value),
                          conversionRate: currencyModel.usd[toCurrency]!,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(fromCurrency),
              const Icon(Icons.arrow_forward),
              Text('$convertedAmount'),
              Text(toCurrency),
            ],
          ),
        );
      },
    );
  }
}
