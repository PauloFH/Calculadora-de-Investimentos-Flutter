import 'package:flutter/material.dart';

import 'tabcdb.dart';
import 'tabpoupanca.dart';

class TabTesouroSelic extends StatelessWidget {
  const TabTesouroSelic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de investimento"),
          backgroundColor: Colors.purple[800],
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                ),
                child: const Text(
                  'Calculadora de investimento',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('CDB'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TabCDB()),
                  );
                },
              ),
              ListTile(
                title: const Text('Poupança'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabPoupanca()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tesouro Selic'),
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
        body: const Center(
          child: Text(
            'Simular Investimento em Tesouro Selic',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
