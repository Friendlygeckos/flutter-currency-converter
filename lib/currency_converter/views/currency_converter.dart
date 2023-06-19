import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_converter/currency_converter/bloc/converter_bloc.dart';
import 'package:flutter_currency_converter/service/enums/bloc_status.dart';
import 'package:flutter_currency_converter/theme/bloc/theme_bloc.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _currencyInputController =
      TextEditingController();
  String dropdownValue = 'jpy';

  @override
  void dispose() {
    _currencyInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toggle = context.select((ThemeBloc bloc) => bloc.state.toggle);

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
            leading: Switch(
              value: toggle,
              onChanged: (bool newValue) =>
                  context.read<ThemeBloc>().add(ToggleTheme()),
            ),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (state.status == BlocStatus.loading) ...[
                const CircularProgressIndicator(),
              ] else ...[
                Center(
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _currencyInputController,
                      onChanged: (value) {
                        bloc.add(
                          InputAmount(
                            amount: value,
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
                DropdownButton<String>(
                  value: dropdownValue,
                  items: availableCurrencies
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                    bloc.add(UpdateSelectedCurrency(selectedCurrency: value!));
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
