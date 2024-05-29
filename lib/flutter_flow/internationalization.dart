import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

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
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

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
  // LoginPage
  {
    'wycppwem': {
      'pt': 'Login',
      'en': 'Login',
    },
    'vhhr07nh': {
      'pt': 'Email',
      'en': 'Email',
    },
    '1bbtaigp': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'bh8g2dmp': {
      'pt': 'Login',
      'en': 'Login',
    },
    'ewbn88zl': {
      'pt': 'Esqueceu a Senha',
      'en': 'Forgot password',
    },
    'w6zfo1e8': {
      'pt': 'Sign Up',
      'en': 'Sign Up',
    },
    'vgr9v4pa': {
      'pt': 'Home',
      'en': 'Home',
    },
    '5p1h8txp': {
      'pt': 'Escolha a biometria desejada',
      'en': 'Choose the desired biometrics',
    },
  },
  // Notifications
  {
    'p8s3pabs': {
      'pt': 'Usuários',
      'en': 'Users',
    },
    '43ub1dxr': {
      'pt': 'Título da Mensagem',
      'en': 'Message Title',
    },
    'ibumhydr': {
      'pt': 'Corpo da Mensagem',
      'en': 'Message Body',
    },
    'sz34hu7s': {
      'pt': 'Enviar Mensagem',
      'en': 'Send Message',
    },
    '5cjr2slc': {
      'pt': 'Enviar para Todos',
      'en': 'Send to All',
    },
    'e6xgarud': {
      'pt': 'Notificações',
      'en': 'Notifications',
    },
  },
  // Biblia
  {
    'ypokceuh': {
      'pt': 'Books',
      'en': 'books',
    },
    't8m43l2q': {
      'pt': 'Pesquisa',
      'en': 'Search',
    },
    'uye01on6': {
      'pt': 'Bíblia',
      'en': 'Bible',
    },
    '920isq2m': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Capitulos
  {
    '2u8prexn': {
      'pt': 'Criar Devocional',
      'en': '',
    },
    'r82y0wrs': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Home
  {
    'ra2xp5kg': {
      'pt': 'With God Devotionals',
      'en': '',
    },
    'yv3m9q1m': {
      'pt': 'Home',
      'en': 'Bible',
    },
    'lrhurybw': {
      'pt': 'Account Options',
      'en': '',
    },
    '3vl3qbyg': {
      'pt': 'Pontuação: 100',
      'en': '',
    },
    'ujadworu': {
      'pt': 'Linguagem da Bíblia',
      'en': '',
    },
    'pd3rsbpb': {
      'pt': 'Settings',
      'en': '',
    },
    '2cehfu5a': {
      'pt': 'Change Password',
      'en': '',
    },
    'adiabzz4': {
      'pt': 'Light Mode',
      'en': '',
    },
    'f9wfb7v2': {
      'pt': 'Dark Mode',
      'en': '',
    },
    '0wbxm6m8': {
      'pt': 'Log out',
      'en': '',
    },
  },
  // DevotionalsDetalhe
  {
    'tfof1o28': {
      'pt': 'Salvar Devocional',
      'en': '',
    },
    '0rximx4h': {
      'pt': 'Home',
      'en': '',
    },
  },
  // DevotionalList
  {
    'm0xgwvyf': {
      'pt': 'Devocionais',
      'en': '',
    },
    'cq31cb2j': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Anuncios
  {
    '89s7ymrf': {
      'pt': '',
      'en': '',
    },
    '9nqj20zj': {
      'pt': 'Pesquisar',
      'en': '',
    },
    'bygnmbu0': {
      'pt': 'Publicações',
      'en': '',
    },
    '7g50mavo': {
      'pt': 'Inserir',
      'en': '',
    },
    '0j0gjpq2': {
      'pt': 'Anúncios',
      'en': '',
    },
    'rs7ac24j': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Quiz
  {
    'h3vvfj7v': {
      'pt': 'Pronto para um desafio?',
      'en': '',
    },
    'x1zcix95': {
      'pt': 'Escolha o nível',
      'en': '',
    },
    'mi8vjdo8': {
      'pt': 'Quiz',
      'en': '',
    },
    'nyi7eoi1': {
      'pt': 'Home',
      'en': '',
    },
  },
  // QuizPerguntas
  {
    'a1atpu1e': {
      'pt': 'Anterior',
      'en': '',
    },
    'oftr8bu5': {
      'pt': 'Home',
      'en': '',
    },
  },
  // QuizFinish
  {
    'k47f1tks': {
      'pt': 'Parabéns',
      'en': '',
    },
    's001cnic': {
      'pt': 'Você venceu!',
      'en': '',
    },
    'q8ec9k8s': {
      'pt': 'Ver respostas',
      'en': '',
    },
    'ce2c8gg4': {
      'pt': 'Novo Jogo',
      'en': '',
    },
    'n3u9kwua': {
      'pt': 'Finalizar',
      'en': '',
    },
    'krdk39ce': {
      'pt': 'Resultado',
      'en': '',
    },
    'ozoiqrtq': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Notificacao
  {
    'f46qbl03': {
      'pt': 'Notificação',
      'en': '',
    },
    'q6jcl044': {
      'pt': 'Home',
      'en': '',
    },
  },
  // compSingUp
  {
    'ccb3h6km': {
      'pt': 'Email',
      'en': 'Email',
    },
    '2tnktwaf': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'z52v5s6g': {
      'pt': 'Confirme a Senha',
      'en': 'Confirm the Password',
    },
    'gi8dderw': {
      'pt': 'Criar Conta',
      'en': 'Create an account',
    },
  },
  // compChangePassword
  {
    'hza9lua8': {
      'pt': 'Change Password',
      'en': 'Change Password',
    },
    'ip78k43x': {
      'pt': 'New Password',
      'en': 'New Password',
    },
    'd78348p3': {
      'pt': 'Enter your new password',
      'en': 'Enter your new password',
    },
    '5vr0otdz': {
      'pt': 'Confirm Password',
      'en': 'Confirm Password',
    },
    '68if3ja3': {
      'pt': 'Confirm your new password',
      'en': 'Confirm your new password',
    },
    'hotlqt0m': {
      'pt': 'Atualizar Senha',
      'en': 'Update Password',
    },
  },
  // compForgottPassword
  {
    '3zxqni9i': {
      'pt': 'Esqueceu sua senha?',
      'en': 'Forgot your password?',
    },
    'ac2j3qzz': {
      'pt': 'Email',
      'en': 'Email',
    },
    'ptea5zs2': {
      'pt': 'Digite seu email',
      'en': 'Type your e-mail',
    },
    '7yve6jrz': {
      'pt': 'REDEFINIR SENHA',
      'en': 'REDEFINE PASSWORD',
    },
  },
  // CompSearchBible
  {
    'j2kq6gwv': {
      'pt': 'Pesquisar',
      'en': 'To look for',
    },
    'qrj72ycw': {
      'pt': '| Versículo:',
      'en': '',
    },
  },
  // compAnuncioEdit
  {
    'wahtedh3': {
      'pt': 'Salão',
      'en': '',
    },
    'cv67fomm': {
      'pt': 'Igreja',
      'en': '',
    },
    'ntt80rs3': {
      'pt': 'Ferramentas',
      'en': '',
    },
    'cecl4116': {
      'pt': 'Outros',
      'en': '',
    },
    '03qis1y5': {
      'pt': 'Selecione tipo Serviço',
      'en': '',
    },
    'q34m56hk': {
      'pt': 'Search for an item...',
      'en': '',
    },
    'tnxm1sj6': {
      'pt': 'Brasil',
      'en': '',
    },
    'sumah71p': {
      'pt': 'EUA',
      'en': '',
    },
    'ztipeg9v': {
      'pt': 'México',
      'en': '',
    },
    'uihy1t66': {
      'pt': 'País',
      'en': '',
    },
    'qd8dpglr': {
      'pt': 'Search for an item...',
      'en': '',
    },
    'pwnm09x0': {
      'pt': 'Empresa',
      'en': '',
    },
    'wdtdh0m4': {
      'pt': 'Endereço',
      'en': '',
    },
    '6iblev6g': {
      'pt': 'Descrição',
      'en': '',
    },
    'laluaco8': {
      'pt': 'Telefone',
      'en': '',
    },
    'h9l96fr5': {
      'pt': 'Instagran',
      'en': '',
    },
    'u5ma6p1x': {
      'pt': 'Site',
      'en': '',
    },
    '3rnv553j': {
      'pt': 'Email',
      'en': '',
    },
    'i18ciwov': {
      'pt': 'Inserir Imagens',
      'en': '',
    },
    '7tc5wskx': {
      'pt': 'Salvar',
      'en': '',
    },
    '0zo73dji': {
      'pt': 'Field is required',
      'en': '',
    },
    'ausupp2f': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'igi8pnum': {
      'pt': 'Field is required',
      'en': '',
    },
    'awo4rzcb': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'm9eu25on': {
      'pt': 'Field is required',
      'en': '',
    },
    'v7ct3kgj': {
      'pt': 'O Limite mínimo é de 3 caracteres',
      'en': '',
    },
    'xsf3d87v': {
      'pt': 'O Limite de campos é de 300 caracteres',
      'en': '',
    },
    '0zgmw9yt': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'gf44tl5b': {
      'pt': 'Field is required',
      'en': '',
    },
    'qeqz2esx': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0iey3f84': {
      'pt': 'Field is required',
      'en': '',
    },
    'kf34dyfm': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0wmn9f1y': {
      'pt': 'Field is required',
      'en': '',
    },
    'tg2v32lz': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '528jt7wp': {
      'pt': 'Field is required',
      'en': '',
    },
    'kd0tjdyz': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '25cdy63r': {
      'pt': 'Conceder acesso para biometria',
      'en': '',
    },
    'qrlniftu': {
      'pt': 'Permitir acessar biometria do seu dispositivo',
      'en': 'Allow access to your device\'s biometrics',
    },
    '5qmf6yzz': {
      'pt': 'Conceder acesso para notificações',
      'en': '',
    },
    'ndrdwakw': {
      'pt': 'Conceder acesso a câmera',
      'en': '',
    },
    '9j8at88a': {
      'pt': '',
      'en': '',
    },
    'ugzxmbc4': {
      'pt': '',
      'en': '',
    },
    '8foh35aq': {
      'pt': '',
      'en': '',
    },
    'vu7kqt2e': {
      'pt': '',
      'en': '',
    },
    'p3atswuv': {
      'pt': '',
      'en': '',
    },
    'xm0l7zu3': {
      'pt': '',
      'en': '',
    },
    'zvqr7j0c': {
      'pt': '',
      'en': '',
    },
    '0263grd4': {
      'pt': '',
      'en': '',
    },
    'nq072ee9': {
      'pt': '',
      'en': '',
    },
    'oqy4u1ny': {
      'pt': '',
      'en': '',
    },
    'f9pvu1c0': {
      'pt': '',
      'en': '',
    },
    '0v94cf4n': {
      'pt': '',
      'en': '',
    },
    'm2a0efy8': {
      'pt': '',
      'en': '',
    },
    '4pumafq8': {
      'pt': '',
      'en': '',
    },
    'a5nf97jt': {
      'pt': '',
      'en': '',
    },
    '9kk140ox': {
      'pt': '',
      'en': '',
    },
    '6lqn12qi': {
      'pt': '',
      'en': '',
    },
    'gvzb21u8': {
      'pt': '',
      'en': '',
    },
    '3zoivd7q': {
      'pt': '',
      'en': '',
    },
    'fdam6fbh': {
      'pt': '',
      'en': '',
    },
    'xoap0f7g': {
      'pt': '',
      'en': '',
    },
    '3q21hvsb': {
      'pt': '',
      'en': '',
    },
    '643myc5p': {
      'pt': '',
      'en': '',
    },
    '0yp9wa67': {
      'pt': '',
      'en': '',
    },
    '12gxr5tu': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
