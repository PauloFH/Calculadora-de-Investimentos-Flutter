import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelectionWidget extends StatelessWidget {
  final Function(Locale) onLanguageSelected;

  LanguageSelectionWidget({required this.onLanguageSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LanguageButton(
          locale: const Locale('en'),
          onPressed: () => onLanguageSelected(const Locale('en')),
          flagAsset: 'assets/flags/us.png', // Substitua pelo caminho da imagem da bandeira
        ),
        LanguageButton(
          locale: const Locale('pt'),
          onPressed: () => onLanguageSelected(const Locale('pt')),
          flagAsset: 'assets/flags/br.png', // Substitua pelo caminho da imagem da bandeira
        ),
        LanguageButton(
          locale: const Locale('th'),
          onPressed: () => onLanguageSelected(const Locale('th')),
          flagAsset: 'assets/flags/th.png', // Substitua pelo caminho da imagem da bandeira
        ),
        LanguageButton(
          locale: const Locale('es'),
          onPressed: () => onLanguageSelected(const Locale('es')),
          flagAsset: 'assets/flags/es.png', // Substitua pelo caminho da imagem da bandeira
        ),
        LanguageButton(
          locale: const Locale('ru'),
          onPressed: () => onLanguageSelected(const Locale('ru')),
          flagAsset: 'assets/flags/ru.png', // Substitua pelo caminho da imagem da bandeira
        ),
      ],
    );
  }
}

class LanguageButton extends StatelessWidget {
  final Locale locale;
  final VoidCallback onPressed;
  final String flagAsset;

  LanguageButton({
    required this.locale,
    required this.onPressed,
    required this.flagAsset,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(flagAsset), // Exibe a bandeira
    );
  }
}
