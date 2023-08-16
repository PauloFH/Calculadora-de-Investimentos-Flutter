import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InvestmentTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String type;
  final Function(String) onValueChanged;

  InvestmentTextField({required this.label, required this.hint, required this.type, required this.onValueChanged});

  @override
  _InvestmentTextFieldState createState() => _InvestmentTextFieldState();
}
class _InvestmentTextFieldState extends State<InvestmentTextField> {
  final TextEditingController _controller = TextEditingController();
  final moneyFormatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters;
    Function(String)? valueChangedFunction;

    if (widget.type == 'money') {
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        TextInputFormatter.withFunction((TextEditingValue oldValue, TextEditingValue newValue) {
          final numericValue = double.tryParse(
              newValue.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

          final newText = moneyFormatter.format(numericValue / 100);

          return TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }),
      ];

      valueChangedFunction = (value) {
        final numericValue = double.tryParse(
            value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

        widget.onValueChanged(numericValue.toString());
      };
    } else {
      inputFormatters = [];
      valueChangedFunction = widget.onValueChanged;
    }

    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
          color: Colors.purple[800],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!, width: 2.0),
        ),
      ),
      style: const TextStyle(fontSize: 30),
      onChanged: valueChangedFunction,
    );
  }
}