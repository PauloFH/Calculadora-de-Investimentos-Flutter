import 'package:flutter/material.dart';

import 'tabTselic.dart';
import 'tabpoupanca.dart';

class TabCDB extends StatelessWidget {
  const TabCDB({super.key});

  @override
  Widget build(BuildContext context) {
    String name = 'CDB';
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
                  MaterialPageRoute(builder: (context) => const TabPoupanca()),
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
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            'Simular Investimento em $name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF6A1B9A),
              width: 25,
            ),
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ]),
    );
  }
}
