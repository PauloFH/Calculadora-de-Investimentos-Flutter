import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investimentos/widgets/LanguageSelectionWidget.dart';
import '../widgets/CompoundInterestCalculatorButton.dart';
import 'home.dart';
import 'tabTselic.dart';
import 'tabpoupanca.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabCDB extends StatefulWidget {
  const TabCDB({super.key});

  @override
  State<TabCDB> createState() => _TabCDBState();
}

class _TabCDBState extends State<TabCDB> {
  double result = 0;

  @override
  Widget build(BuildContext context) {
    String name = 'CDB';
    final moneyFormatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    /* List<TextInputFormatter>? inputFormatters = [
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
      ];*/

    final controlller = TextEditingController();
    final controllerMes = TextEditingController();
    final controllerInvest = TextEditingController();
    double d = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appbartxt),
        backgroundColor: Colors.purple[800],
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[800],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[800],
              ),
              child: Text(
                AppLocalizations.of(context)!.appbartxt,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.home,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.cdb,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TabCDB()),
                );
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.savingsAccount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TabPoupanca()),
                );
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.selic,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TabTesouroSelic()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text(
                'Simular Investimento em $name',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              child: TextField(
                controller: controllerInvest,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.initInvestiment,
                  hintText: "0,00",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.purple[800],
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple[800]!, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple[800]!, width: 2.0),
                  ),
                ),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              child: TextField(
                controller: controllerMes,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.monthlyInvestiment,
                  hintText: "0,00",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.purple[800],
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple[800]!, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple[800]!, width: 2.0),
                  ),
                ),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              child: TextField(
                controller: controlller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.months,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.purple[800],
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple[800]!, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purple[800]!, width: 2.0),
                  ),
                ),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              child: CompoundInterestCalculatorButton(
                onPressed: () {
                  setState(() {
                    result = calculateCompoundInterest(
                      double.parse(controllerInvest.text),
                      double.parse(controllerMes.text),
                      int.parse(controlller.text),
                    );
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.purple[800]!,
                  width: 2,
                ),
              ),
              child: Text(
                  ' ${AppLocalizations.of(context)!.brl} \n R\$ ${result.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

  double calculateCompoundInterest(
    double initialInvestment,
    double monthlyInvestment,
    int months,
  ) {
    double juros = 0;
    double saldoAcumulado = initialInvestment;
    for (int i = 1; i <= months; i++) {
      juros = (saldoAcumulado! * ((0.5) / 100));
      saldoAcumulado += juros + monthlyInvestment;
    }
    return saldoAcumulado;
  }
}
