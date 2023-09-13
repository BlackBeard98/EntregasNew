import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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
  // ProductoVIew
  {
    '9e4mnsi0': {
      'es': ' ',
      'en': '',
    },
    'nmanpwot': {
      'es': '3',
      'en': '',
    },
    'm7kl8eww': {
      'es': 'Añadir al carrito',
      'en': '',
    },
    'gq08lyt3': {
      'es': 'Home',
      'en': '',
    },
  },
  // login
  {
    'po69vlq3': {
      'es': 'Entregas',
      'en': '',
    },
    'lkqzbtqx': {
      'es': 'Bienvenido',
      'en': '',
    },
    '7x891v18': {
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'en': '',
    },
    'ga4rfjjd': {
      'es': 'Email',
      'en': '',
    },
    '1ohqyikt': {
      'es': 'Contraseña',
      'en': '',
    },
    'dueczkl6': {
      'es': 'Loguearse',
      'en': '',
    },
    '9x5ft1pu': {
      'es': 'No tienes cuenta? ',
      'en': '',
    },
    'csmdmikn': {
      'es': 'Regístrate aquí',
      'en': '',
    },
    'y3b6o452': {
      'es': 'Home',
      'en': '',
    },
  },
  // Productos
  {
    'h4c8ksu0': {
      'es': 'Buscar Producto',
      'en': '',
    },
    'hm474b4h': {
      'es': 'Productos',
      'en': '',
    },
    '4tqzjz41': {
      'es': 'Ver ahora',
      'en': '',
    },
    'fc5tmi06': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en': '',
    },
    'g93suddy': {
      'es': 'Jackson Hewiit',
      'en': '',
    },
    'anwz5i4y': {
      'es': '24',
      'en': '',
    },
    '9ywptdvd': {
      'es': '12h',
      'en': '',
    },
    'da3r9g2o': {
      'es': 'Read Now',
      'en': '',
    },
    'ao0bmbay': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en': '',
    },
    '205y9xdn': {
      'es': 'Jackson Hewiit',
      'en': '',
    },
    'ci5frk4e': {
      'es': '24',
      'en': '',
    },
    'vazhdp21': {
      'es': '12h',
      'en': '',
    },
    'e97upvdm': {
      'es': 'Read Now',
      'en': '',
    },
    '55y9yd13': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en': '',
    },
    'z7lsby1j': {
      'es': 'Jackson Hewiit',
      'en': '',
    },
    'qwjnotgs': {
      'es': '24',
      'en': '',
    },
    'wwsiowkm': {
      'es': '12h',
      'en': '',
    },
    'bsjw5dru': {
      'es': 'Read Now',
      'en': '',
    },
    'huv737bh': {
      'es': 'Home',
      'en': '',
    },
  },
  // Carrito
  {
    'pnxf4zs4': {
      'es': 'Tu Carrito',
      'en': '',
    },
    'djuc3j4a': {
      'es': 'Abajo esta la lista de items de su carrito',
      'en': '',
    },
    '73aojaqv': {
      'es': 'Size: ',
      'en': '',
    },
    'kh5xbvg3': {
      'es': '12',
      'en': '',
    },
    'qfkbbtl6': {
      'es': 'Remove',
      'en': '',
    },
    'd11g6cvx': {
      'es': 'Air Max',
      'en': '',
    },
    'r4t7irry': {
      'es': 'Size: ',
      'en': '',
    },
    'jbg7lnlj': {
      'es': '12',
      'en': '',
    },
    '8j0r9m5g': {
      'es': '\$117.00',
      'en': '',
    },
    'epygxr75': {
      'es':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'en': '',
    },
    'oryaqhd1': {
      'es': 'Remove',
      'en': '',
    },
    '2w3tgu27': {
      'es': 'Order Summary',
      'en': '',
    },
    'n8veao96': {
      'es': 'Below is a list of your items.',
      'en': '',
    },
    'qkx8dmof': {
      'es': 'Price Breakdown',
      'en': '',
    },
    '9squbvu4': {
      'es': 'Base Price',
      'en': '',
    },
    'hfkim5er': {
      'es': '\$156.00',
      'en': '',
    },
    '850b03ti': {
      'es': 'Taxes',
      'en': '',
    },
    '4x2q6ccl': {
      'es': '\$24.20',
      'en': '',
    },
    'mk9fbo1s': {
      'es': 'Cleaning Fee',
      'en': '',
    },
    'ljlbb403': {
      'es': '\$40.00',
      'en': '',
    },
    'kda8rya0': {
      'es': 'Total',
      'en': '',
    },
    'v2qa80q1': {
      'es': '\$230.20',
      'en': '',
    },
    'ortpe3tp': {
      'es': 'Continue to Checkout',
      'en': '',
    },
    '0swvummf': {
      'es': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'z8l0t4cu': {
      'es': '',
      'en': '',
    },
    '023ihgdz': {
      'es': '',
      'en': '',
    },
    'sz6v52n7': {
      'es': '',
      'en': '',
    },
    '7ivn42ft': {
      'es': '',
      'en': '',
    },
    'vum0v8sj': {
      'es': '',
      'en': '',
    },
    'n0ppjyxn': {
      'es': '',
      'en': '',
    },
    '3ivi6nhl': {
      'es': '',
      'en': '',
    },
    'rcihbngg': {
      'es': '',
      'en': '',
    },
    'r0m7q35g': {
      'es': '',
      'en': '',
    },
    'tw4nnf86': {
      'es': '',
      'en': '',
    },
    'mdy7qpq6': {
      'es': '',
      'en': '',
    },
    '9w7fcscf': {
      'es': '',
      'en': '',
    },
    'x48yaj56': {
      'es': '',
      'en': '',
    },
    '4zr1gp1o': {
      'es': '',
      'en': '',
    },
    '6cvnt174': {
      'es': '',
      'en': '',
    },
    'b2wq7h1c': {
      'es': '',
      'en': '',
    },
    '331jqf1o': {
      'es': '',
      'en': '',
    },
    '74r2xs03': {
      'es': '',
      'en': '',
    },
    'j5b8b71t': {
      'es': '',
      'en': '',
    },
    'wcdl971q': {
      'es': '',
      'en': '',
    },
    'yu2r6kfg': {
      'es': '',
      'en': '',
    },
    '2mzlc2bi': {
      'es': '',
      'en': '',
    },
    'a14daqwn': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
