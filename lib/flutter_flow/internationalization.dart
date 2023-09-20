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
    'm7kl8eww': {
      'es': 'Añadir al carrito',
      'en': 'Add to cart',
    },
    'gq08lyt3': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // login
  {
    'po69vlq3': {
      'es': 'Entregas',
      'en': 'Deliveries',
    },
    'lkqzbtqx': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    '7x891v18': {
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'en': 'Please complete the information below to access your account.',
    },
    'ga4rfjjd': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '1ohqyikt': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'dueczkl6': {
      'es': 'Loguearse',
      'en': 'Login',
    },
    '9x5ft1pu': {
      'es': 'No tienes cuenta? ',
      'en': 'You do not have an account?',
    },
    'csmdmikn': {
      'es': 'Regístrate aquí',
      'en': 'Sign up here',
    },
    'y3b6o452': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Productos
  {
    'jw8vjwn0': {
      'es': 'Buscar Producto',
      'en': 'Search Product',
    },
    'wu4mn0qy': {
      'es': 'Productos',
      'en': 'Products',
    },
    '67sl1u81': {
      'es': 'Ver Detalles',
      'en': 'See details',
    },
    '7oae2ar5': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
    },
    '5uayvmra': {
      'es': 'Jackson Hewiit',
      'en': 'Jackson Hewitt',
    },
    'spj4zop0': {
      'es': '24',
      'en': '24',
    },
    '3qfh4hkq': {
      'es': '12h',
      'en': '12h',
    },
    '6w3zq7fa': {
      'es': 'Read Now',
      'en': 'Read Now',
    },
    '9ot1f74d': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
    },
    'p33rwiel': {
      'es': 'Jackson Hewiit',
      'en': 'Jackson Hewitt',
    },
    'lxlmznim': {
      'es': '24',
      'en': '24',
    },
    'muwunlv6': {
      'es': '12h',
      'en': '12h',
    },
    'y9glqlxa': {
      'es': 'Read Now',
      'en': 'Read Now',
    },
    '7bkscrtj': {
      'es':
          'HSBC is getting back into consumer lending in the us according to...',
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
    },
    '67c4iicn': {
      'es': 'Jackson Hewiit',
      'en': 'Jackson Hewitt',
    },
    'iayd6nzc': {
      'es': '24',
      'en': '24',
    },
    'f2n5lfv4': {
      'es': '12h',
      'en': '12h',
    },
    's69akt1b': {
      'es': 'Read Now',
      'en': 'Read Now',
    },
    'huv737bh': {
      'es': 'Productos',
      'en': 'Products',
    },
  },
  // Carrito
  {
    '5yfhfo03': {
      'es': 'Eliminar',
      'en': 'Eliminate',
    },
    'djuc3j4a': {
      'es': 'Abajo esta la lista de items de su carrito',
      'en': 'Below is the list of items in your cart',
    },
    '73aojaqv': {
      'es': 'Cantidad:',
      'en': 'Amount:',
    },
    'qfkbbtl6': {
      'es': 'Remove',
      'en': 'Remove',
    },
    'd11g6cvx': {
      'es': 'Air Max',
      'en': 'air max',
    },
    'r4t7irry': {
      'es': 'Size: ',
      'en': 'Size:',
    },
    'jbg7lnlj': {
      'es': '12',
      'en': '12',
    },
    '8j0r9m5g': {
      'es': '\$117.00',
      'en': '\$117.00',
    },
    'epygxr75': {
      'es':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
    },
    'oryaqhd1': {
      'es': 'Remove',
      'en': 'Remove',
    },
    '2w3tgu27': {
      'es': 'Resumen de Pedido',
      'en': 'Order Summary',
    },
    'n8veao96': {
      'es': 'Abajo hay un resumen de su Pedido',
      'en': 'Below is a summary of your Order',
    },
    'kda8rya0': {
      'es': 'Total',
      'en': 'Total',
    },
    'ortpe3tp': {
      'es': 'Realizar Orden',
      'en': 'Place Order',
    },
    '0swvummf': {
      'es': 'Carrito',
      'en': 'Trolley',
    },
  },
  // Cuenta
  {
    'y45zvm7x': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'vgzwxvqa': {
      'es': 'Mis Direcciones',
      'en': 'My Addresses',
    },
    '85i4m8il': {
      'es': 'Mis Pedidos',
      'en': 'My orders',
    },
    'yot0m3m0': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    '7x7khhkk': {
      'es': 'Mi Carrito',
      'en': 'My cart',
    },
    'rhvddj3z': {
      'es': 'Cerrar Sesión ',
      'en': 'Sign off',
    },
    'sfux1xfn': {
      'es': 'Cuenta',
      'en': 'Account',
    },
  },
  // registro
  {
    'auknhx7m': {
      'es': 'Entregas',
      'en': 'Deliveries',
    },
    'u35i37kf': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    'emc86s9z': {
      'es': 'Complete la información a continuación para crear a su cuenta.',
      'en': 'Complete the information below to create your account.',
    },
    'ajba11pp': {
      'es': 'Nombre',
      'en': 'Name',
    },
    'hgag4u45': {
      'es': 'Apellido1',
      'en': 'Lastname 1',
    },
    'f4qfu4au': {
      'es': 'Apellido2',
      'en': 'Surname 2',
    },
    '3b0ni7vu': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'opjoryn8': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'jeq5nexv': {
      'es': 'Registrase',
      'en': 'Register',
    },
    'smh7sy49': {
      'es': 'Ya tienes cuenta? ',
      'en': 'Do you already have an account?',
    },
    'rbrr67xn': {
      'es': 'Accede aquí',
      'en': 'Access here',
    },
    'cll6dafm': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // SeleccionarLoc
  {
    '9tlffo20': {
      'es': 'Escoja el municipio donde va a comprar',
      'en': 'Choose the municipality where you are going to buy',
    },
    'z9u4k587': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    '0spnh94r': {
      'es': 'Please select...',
      'en': 'Please select...',
    },
    '1nbv2dw3': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '4c52kgyi': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'olt7wxdv': {
      'es': 'Please select...',
      'en': 'Please select...',
    },
    'chogp8cx': {
      'es': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'x3xh1i3e': {
      'es': 'Avanzar a Comprar',
      'en': 'Advance to Buy',
    },
    '70rwjpl6': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Checkout6
  {
    'equuqv8b': {
      'es': 'Below are the items in your cart.',
      'en': 'Below are the items in your cart.',
    },
    'cgc2mlvg': {
      'es': 'AirMax Low',
      'en': 'AirMax Low',
    },
    'zqdkf8vl': {
      'es': '\$120.00',
      'en': '\$120.00',
    },
    '752vceih': {
      'es': 'Quanity: 1',
      'en': 'Quanity: 1',
    },
    'z8e09agx': {
      'es': 'Zion 1',
      'en': 'Zion 1',
    },
    'v9h966c7': {
      'es': '\$120.00',
      'en': '\$120.00',
    },
    'nb5eyd0r': {
      'es': 'Quanity: 1',
      'en': 'Quanity: 1',
    },
    'ddun6rfb': {
      'es': 'Jumpsuit',
      'en': 'Jumpsuit',
    },
    'wrh5tn26': {
      'es': '\$120.00',
      'en': '\$120.00',
    },
    'glysdrcu': {
      'es': 'Quanity: 1',
      'en': 'Quanity: 1',
    },
    'mowllo3a': {
      'es': 'Price Breakdown',
      'en': 'Price Breakdown',
    },
    'rz0l11c5': {
      'es': 'Base Price',
      'en': 'Base Price',
    },
    'wuepo5n1': {
      'es': '\$120.00',
      'en': '\$120.00',
    },
    'd1n0mrsi': {
      'es': 'Taxes',
      'en': 'Taxes',
    },
    'xuopge7z': {
      'es': '\$12.25',
      'en': '\$12.25',
    },
    '6zh40sct': {
      'es': 'Total',
      'en': 'Total',
    },
    'ws71eec7': {
      'es': '\$137.75',
      'en': '\$137.75',
    },
    'qlbmf754': {
      'es': 'Checkout (\$137.75)',
      'en': 'Checkout (\$137.75)',
    },
    'w0lucjja': {
      'es': 'My Cart',
      'en': 'My Cart',
    },
    'oq0mbqaa': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ProductosCopy
  {
    'zhxta0cf': {
      'es': 'Comprando en ',
      'en': 'Buying at',
    },
    '9an139nf': {
      'es': 'Buscar Producto',
      'en': 'Search Product',
    },
    '65udvxah': {
      'es': 'Productos',
      'en': 'Products',
    },
    '5sqwymw2': {
      'es': 'Ver Detalles',
      'en': 'See details',
    },
    'u9rg2icw': {
      'es': 'Productos',
      'en': 'Products',
    },
  },
  // pedidos
  {
    'tbr8hqx8': {
      'es': 'Pedidos',
      'en': 'Orders',
    },
    '2dbpv3u2': {
      'es': 'Abajo se puede observar una lista con sus pedidos',
      'en': 'Below you can see a list of your orders',
    },
    '7l10yga2': {
      'es': 'Pedido #: ',
      'en': 'Order #:',
    },
    'ez30agxi': {
      'es': 'Order #: ',
      'en': 'Order #:',
    },
    '25dussh9': {
      'es': '429242424',
      'en': '429242424',
    },
    '6als6j3g': {
      'es': 'Mon. July 3rd',
      'en': 'Mon. July 3rd',
    },
    '06dp9q7s': {
      'es': '2.5 lbs',
      'en': '2.5 lbs',
    },
    'x8su3l48': {
      'es': '\$1.50',
      'en': '\$1.50',
    },
    '3r28pmyl': {
      'es': 'Shipped',
      'en': 'Shipped',
    },
    '01udl4h1': {
      'es': 'Order #: ',
      'en': 'Order #:',
    },
    'vm3qcr50': {
      'es': '429242424',
      'en': '429242424',
    },
    'm3pfdi8a': {
      'es': 'Mon. July 3rd',
      'en': 'Mon. July 3rd',
    },
    '11ng5aoz': {
      'es': '2.5 lbs',
      'en': '2.5 lbs',
    },
    'hqnmz1wr': {
      'es': '\$1.50',
      'en': '\$1.50',
    },
    'l5i7qgbs': {
      'es': 'Accepted',
      'en': 'Accepted',
    },
    'twbqk5xe': {
      'es': 'Order #: ',
      'en': 'Order #:',
    },
    'ayf7pfmk': {
      'es': '429242424',
      'en': '429242424',
    },
    'i0ylrznn': {
      'es': 'Mon. July 3rd',
      'en': 'Mon. July 3rd',
    },
    'pfbj3f0g': {
      'es': '2.5 lbs',
      'en': '2.5 lbs',
    },
    'lah38of1': {
      'es': '\$1.50',
      'en': '\$1.50',
    },
    'wmfwk5ll': {
      'es': 'Accepted',
      'en': 'Accepted',
    },
    '5myjkpl9': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ProductosVacio
  {
    'uyg67hek': {
      'es': 'No Hay Productos',
      'en': 'There are no products',
    },
  },
  // ShowAndChangeLocation
  {
    'lwjfocu7': {
      'es': 'Comprando en ',
      'en': 'Buying at',
    },
    '0fprk0ue': {
      'es': ' Cambiar?',
      'en': 'Change?',
    },
  },
  // Header1
  {
    'uv7rofrv': {
      'es': 'Welcome!',
      'en': 'Welcome!',
    },
    'rg9o9qm5': {
      'es': 'Find your Dream Space',
      'en': 'Find your Dream Space',
    },
    'bp5ql35x': {
      'es': 'Search',
      'en': 'Search',
    },
  },
  // Tabla
  {
    '7zcffw53': {
      'es': 'Card Header',
      'en': 'Card Header',
    },
    '5ykg0b8i': {
      'es': '12',
      'en': '12',
    },
    'jltd4kia': {
      'es': 'Create tables and ui elements that work below.',
      'en': 'Create tables and ui elements that work below.',
    },
    '3lcjiuc4': {
      'es': 'Search users...',
      'en': 'Search users...',
    },
    '1zvce2x9': {
      'es': 'Customer Info',
      'en': 'Customer Info',
    },
    't6zeq6da': {
      'es': 'Paid On',
      'en': 'Paid On',
    },
    'y18lle6x': {
      'es': 'Invoice #',
      'en': 'Invoice #',
    },
    '9054bdjs': {
      'es': 'Status',
      'en': 'Status',
    },
    'cg97wufb': {
      'es': 'Amount',
      'en': 'Amount',
    },
    'rfjmmtbh': {
      'es': 'Actions',
      'en': 'Actions',
    },
    '98h6sq2h': {
      'es': 'Randy Peterson',
      'en': 'Randy Peterson',
    },
    'n7k80vjw': {
      'es': 'Jan. 30th, 2023',
      'en': 'Jan. 30th, 2023',
    },
    'kcexzf34': {
      'es': '10 days ago',
      'en': '10 days ago',
    },
    't7ir4b4w': {
      'es': '#42925424',
      'en': '#42925424',
    },
    'ere10ypn': {
      'es': 'Paid',
      'en': 'paid',
    },
    '4rdifbee': {
      'es': '\$2,100.00',
      'en': '\$2,100.00',
    },
    'czqywwup': {
      'es': 'Randy Peterson',
      'en': 'Randy Peterson',
    },
    '4jh5hi14': {
      'es': 'Jan. 30th, 2023',
      'en': 'Jan. 30th, 2023',
    },
    'l3jg5jmv': {
      'es': '10 days ago',
      'en': '10 days ago',
    },
    'at2j6oha': {
      'es': '#42925424',
      'en': '#42925424',
    },
    'riu2gr5r': {
      'es': 'Paid',
      'en': 'paid',
    },
    'u10awrwl': {
      'es': '\$2,100.00',
      'en': '\$2,100.00',
    },
    'viyiymar': {
      'es': 'Randy Peterson',
      'en': 'Randy Peterson',
    },
    'wkydvkwb': {
      'es': 'Jan. 30th, 2023',
      'en': 'Jan. 30th, 2023',
    },
    'fcbsrc98': {
      'es': '10 days ago',
      'en': '10 days ago',
    },
    'mxkzcvgx': {
      'es': '#42925424',
      'en': '#42925424',
    },
    'sicablzw': {
      'es': 'Paid',
      'en': 'paid',
    },
    'r9532fc6': {
      'es': '\$2,100.00',
      'en': '\$2,100.00',
    },
  },
  // ResumenPedido
  {
    'z5522vtj': {
      'es': 'Resumen del Pedido:',
      'en': 'Order summary:',
    },
    '9iklzwph': {
      'es': 'Creación ',
      'en': 'Creation',
    },
    'dyi626o1': {
      'es': 'Revise su orden',
      'en': 'Check your order',
    },
    'hbgi3l0l': {
      'es': 'Item Name',
      'en': 'Item Name',
    },
    '3lh7yj6j': {
      'es': 'Secondary text',
      'en': 'Secondary text',
    },
    'l1qcf633': {
      'es': '\$1.50',
      'en': '\$1.50',
    },
    'pj860l4g': {
      'es': 'Desglose',
      'en': 'Breakdown',
    },
    'pi9003jq': {
      'es': 'Precio',
      'en': 'Price',
    },
    'bu1l0kev': {
      'es': 'Estado',
      'en': 'State',
    },
    'r05yiboj': {
      'es': 'Precio Final',
      'en': 'Final price',
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
