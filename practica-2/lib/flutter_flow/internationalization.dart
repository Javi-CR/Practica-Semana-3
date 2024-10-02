import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ktsx786v': {
      'en': 'Práctica',
      'es': 'Práctica',
    },
    'd99v9gst': {
      'en': 'Segunda pantalla',
      'es': 'Segunda pantalla',
    },
    'ddw87ktj': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Segunda
  {
    'lgjtodmf': {
      'en': 'Segunda Página',
      'es': 'Segunda página',
    },
    'nqlgob8b': {
      'en': 'Segunda Pantalla',
      'es': 'Segunda Pantalla',
    },
    'eadm8kjq': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Miscellaneous
  {
    '6n41tovq': {
      'en': 'Se necesita permisos de localización',
      'es': 'Se necesita permisos de localización',
    },
    'mw0od0qr': {
      'en': '',
      'es': '',
    },
    'knqdbrel': {
      'en': '',
      'es': '',
    },
    'f35t35ki': {
      'en': '',
      'es': '',
    },
    'ex8abheo': {
      'en': '',
      'es': '',
    },
    'zejxwk2v': {
      'en': '',
      'es': '',
    },
    'ybqm7rur': {
      'en': '',
      'es': '',
    },
    'k5qpf41x': {
      'en': '',
      'es': '',
    },
    '9rxa86ao': {
      'en': '',
      'es': '',
    },
    'fhdeujks': {
      'en': '',
      'es': '',
    },
    'o2n6ymvw': {
      'en': '',
      'es': '',
    },
    '59b7jhch': {
      'en': '',
      'es': '',
    },
    'fcen7fos': {
      'en': '',
      'es': '',
    },
    '420yqn29': {
      'en': '',
      'es': '',
    },
    'tnd44drk': {
      'en': '',
      'es': '',
    },
    'fahar1k8': {
      'en': '',
      'es': '',
    },
    'ck2i6g49': {
      'en': '',
      'es': '',
    },
    'qtffcai9': {
      'en': '',
      'es': '',
    },
    'zd55sg8e': {
      'en': '',
      'es': '',
    },
    'ggy6t1f6': {
      'en': '',
      'es': '',
    },
    'zd7r4rul': {
      'en': '',
      'es': '',
    },
    'qullew2q': {
      'en': '',
      'es': '',
    },
    'kq59nfb4': {
      'en': '',
      'es': '',
    },
    '46iw12tt': {
      'en': '',
      'es': '',
    },
    'l2by8tqr': {
      'en': '',
      'es': '',
    },
    '1jiayuqz': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
