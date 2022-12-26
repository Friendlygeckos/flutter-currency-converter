import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_converter/bloc/converter_bloc.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController currencyInputController = TextEditingController();

  @override
  void dispose() {
    currencyInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConverterBloc, ConverterState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final bloc = context.read<ConverterBloc>();
        final convertedAmount = state.convertedAmount;
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
                    controller: currencyInputController,
                    onChanged: (value) {
                      debugPrint(value);
                      bloc.add(
                        InputAmount(
                          amount: double.parse(value),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Text('USD'),
              Text('$convertedAmount'),
              const Text('JPY'),
            ],
          ),
        );
      },
    );
  }
}
