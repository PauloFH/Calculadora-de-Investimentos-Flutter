import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompoundInterestCalculatorButton extends StatelessWidget {
  final VoidCallback onPressed;

  CompoundInterestCalculatorButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.purple[800]),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
      ),
      child: Text(
        AppLocalizations.of(context)!.calculate,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
