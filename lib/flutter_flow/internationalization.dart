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
    'uhnk2r22': {
      'es': 'Comprando en ',
      'en': '',
    },
    '630momti': {
      'es': ' Cambiar?',
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
    '3lfnk11d': {
      'es': 'Comprando en ',
      'en': '',
    },
    'gfmdy4le': {
      'es': ' Cambiar?',
      'en': '',
    },
    'eud7yoaz': {
      'es': 'Buscar Producto',
      'en': '',
    },
    'm0squd3z': {
      'es': 'Productos',
      'en': '',
    },
    '9w0jihx9': {
      'es': 'Ver Detalles',
      'en': '',
    },
    '1fkm0ojg': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en': '',
    },
    '329dts94': {
      'es': 'Jackson Hewiit',
      'en': '',
    },
    'irs7qk5j': {
      'es': '24',
      'en': '',
    },
    'e6z6u4wj': {
      'es': '12h',
      'en': '',
    },
    'm995no19': {
      'es': 'Read Now',
      'en': '',
    },
    'cj2cgrjc': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en': '',
    },
    '6ldzbvrr': {
      'es': 'Jackson Hewiit',
      'en': '',
    },
    '3j4f3jya': {
      'es': '24',
      'en': '',
    },
    'z5xj9gal': {
      'es': '12h',
      'en': '',
    },
    'deiil3ik': {
      'es': 'Read Now',
      'en': '',
    },
    'irnwfhdw': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en': '',
    },
    'y8grto8j': {
      'es': 'Jackson Hewiit',
      'en': '',
    },
    'zok8q3rp': {
      'es': '24',
      'en': '',
    },
    '1szfbi9k': {
      'es': '12h',
      'en': '',
    },
    'p78rzwqx': {
      'es': 'Read Now',
      'en': '',
    },
    'huv737bh': {
      'es': 'Productos',
      'en': '',
    },
  },
  // Carrito
  {
    '11ozgxvt': {
      'es': 'Comprando en ',
      'en': '',
    },
    'usatyrlu': {
      'es': ' Cambiar?',
      'en': '',
    },
    'djuc3j4a': {
      'es': 'Abajo esta la lista de items de su carrito',
      'en': '',
    },
    '73aojaqv': {
      'es': 'Cantidad:',
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
      'es': 'Resumen de Pedido',
      'en': '',
    },
    'n8veao96': {
      'es': 'Abajo hay un resumen de su Pedido',
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
      'es': 'Carrito',
      'en': '',
    },
  },
  // prof
  {
    'zh5m3dfz': {
      'es': 'Edit Profile',
      'en': '',
    },
    'yaa4t65l': {
      'es': 'Change Password',
      'en': '',
    },
    'hynsq462': {
      'es': 'Notification Settings',
      'en': '',
    },
    '0qw4ul1f': {
      'es': 'Terms of Services',
      'en': '',
    },
    '5dymk0il': {
      'es': 'Log Out',
      'en': '',
    },
  },
  // Cuenta
  {
    'y45zvm7x': {
      'es': 'Cuenta',
      'en': '',
    },
    'vgzwxvqa': {
      'es': 'Mis Direcciones',
      'en': '',
    },
    '85i4m8il': {
      'es': 'Mis Pedidods',
      'en': '',
    },
    'yot0m3m0': {
      'es': 'Editar Perfil',
      'en': '',
    },
    '7x7khhkk': {
      'es': 'Mi Carrito',
      'en': '',
    },
    'rhvddj3z': {
      'es': 'Cerrar Sesión ',
      'en': '',
    },
    'sfux1xfn': {
      'es': 'Cuenta',
      'en': '',
    },
  },
  // registro
  {
    'auknhx7m': {
      'es': 'Entregas',
      'en': '',
    },
    'u35i37kf': {
      'es': 'Bienvenido',
      'en': '',
    },
    'emc86s9z': {
      'es': 'Complete la información a continuación para crear a su cuenta.',
      'en': '',
    },
    'ajba11pp': {
      'es': 'Nombre',
      'en': '',
    },
    'hgag4u45': {
      'es': 'Apellido1',
      'en': '',
    },
    'f4qfu4au': {
      'es': 'Apellido2',
      'en': '',
    },
    '3b0ni7vu': {
      'es': 'Contraseña',
      'en': '',
    },
    'opjoryn8': {
      'es': 'Email',
      'en': '',
    },
    'jeq5nexv': {
      'es': 'Registrase',
      'en': '',
    },
    'smh7sy49': {
      'es': 'Ya tienes cuenta? ',
      'en': '',
    },
    'rbrr67xn': {
      'es': 'Accede aquí',
      'en': '',
    },
    'cll6dafm': {
      'es': 'Home',
      'en': '',
    },
  },
  // SeleccionarLoc
  {
    '9tlffo20': {
      'es': 'Escoja el municipio donde va a comprar',
      'en': '',
    },
    'z9u4k587': {
      'es': 'Option 1',
      'en': '',
    },
    '0spnh94r': {
      'es': 'Please select...',
      'en': '',
    },
    '1nbv2dw3': {
      'es': 'Search for an item...',
      'en': '',
    },
    '4c52kgyi': {
      'es': 'Option 1',
      'en': '',
    },
    'olt7wxdv': {
      'es': 'Please select...',
      'en': '',
    },
    'chogp8cx': {
      'es': 'Search for an item...',
      'en': '',
    },
    'x3xh1i3e': {
      'es': 'Avanzar a Comprar',
      'en': '',
    },
    '70rwjpl6': {
      'es': 'Home',
      'en': '',
    },
  },
  // Checkout6
  {
    'equuqv8b': {
      'es': 'Below are the items in your cart.',
      'en': '',
    },
    'cgc2mlvg': {
      'es': 'AirMax Low',
      'en': '',
    },
    'zqdkf8vl': {
      'es': '\$120.00',
      'en': '',
    },
    '752vceih': {
      'es': 'Quanity: 1',
      'en': '',
    },
    'z8e09agx': {
      'es': 'Zion 1',
      'en': '',
    },
    'v9h966c7': {
      'es': '\$120.00',
      'en': '',
    },
    'nb5eyd0r': {
      'es': 'Quanity: 1',
      'en': '',
    },
    'ddun6rfb': {
      'es': 'Jumpsuit',
      'en': '',
    },
    'wrh5tn26': {
      'es': '\$120.00',
      'en': '',
    },
    'glysdrcu': {
      'es': 'Quanity: 1',
      'en': '',
    },
    'mowllo3a': {
      'es': 'Price Breakdown',
      'en': '',
    },
    'rz0l11c5': {
      'es': 'Base Price',
      'en': '',
    },
    'wuepo5n1': {
      'es': '\$120.00',
      'en': '',
    },
    'd1n0mrsi': {
      'es': 'Taxes',
      'en': '',
    },
    'xuopge7z': {
      'es': '\$12.25',
      'en': '',
    },
    '6zh40sct': {
      'es': 'Total',
      'en': '',
    },
    'ws71eec7': {
      'es': '\$137.75',
      'en': '',
    },
    'qlbmf754': {
      'es': 'Checkout (\$137.75)',
      'en': '',
    },
    'w0lucjja': {
      'es': 'My Cart',
      'en': '',
    },
    'oq0mbqaa': {
      'es': 'Home',
      'en': '',
    },
  },
  // ProductosCopy
  {
    'zhxta0cf': {
      'es': 'Comprando en ',
      'en': '',
    },
    '9an139nf': {
      'es': 'Buscar Producto',
      'en': '',
    },
    '65udvxah': {
      'es': 'Productos',
      'en': '',
    },
    'pr4hsllr': {
      'es': 'Ver Detalles',
      'en': '',
    },
    'u9rg2icw': {
      'es': 'Productos',
      'en': '',
    },
  },
  // ProductosVacio
  {
    'uyg67hek': {
      'es': 'No Hay Productos',
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
