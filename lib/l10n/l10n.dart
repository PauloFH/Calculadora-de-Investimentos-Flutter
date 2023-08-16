import 'dart:ui';

import 'package:flutter/material.dart';

class L10n {
  static final all = {
    const Locale('en'),
    const Locale('pt'),
    const Locale('th'),
    const Locale('es'),
    const Locale('ru'),
  };

  static getFlag(String languageCode) {
    switch (languageCode) {
      case 'en':
        return '🇺🇸';
      case 'th':
        return '🇹🇭';
      case 'pt':
        return '🇧🇷';
      case 'es':
        return '🇪🇸';
      case 'ru':
        return '🇷🇺';
    }
  }
}
