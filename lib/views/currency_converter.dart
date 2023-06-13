import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_converter/bloc/converter_bloc.dart';
import 'package:flutter_currency_converter/service/enums/bloc_status.dart';

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
        final availableCurrencies = state.availableCurrencies;
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
              // TODO(Ryan): show a progress indicator before loading dropdown values
              // DropdownButton<String>(
              //   value: availableCurrencies[0],
              //   items: availableCurrencies
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value.toString()),
              //     );
              //   }).toList(),
              //   onChanged: (String? newValue) {
              //     debugPrint('$newValue');
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
