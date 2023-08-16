import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investimentos/widgets/LanguageSelectionWidget.dart';
import 'tabTselic.dart';
import 'tabcdb.dart';
import 'tabpoupanca.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
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
 body: MyImage(),
    );
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.purple[800],
          ),
          child:  Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Text(
              AppLocalizations.of(context)!.hometxt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
        ),
        Expanded(
          child: Image.asset(
            'assets/images/background.png', // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover, // Isso esticará a imagem para preencher a tela
          ),
        ),
        // Outros widgets ou conteúdo aqui
      ],
    );
  }
}
