import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de', 'fr', 'es', 'it'];

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
    String? deText = '',
    String? frText = '',
    String? esText = '',
    String? itText = '',
  }) =>
      [enText, deText, frText, esText, itText][languageIndex] ?? '';

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
    '2ixte5ku': {
      'en': 'One of your balances is running  low, need some cash?',
      'de': 'Ihr Guthaben geht zur Neige, Sie brauchen etwas Bargeld?',
      'es': 'Tu saldo se está agotando, ¿necesitas algo de efectivo?',
      'fr': 'Votre solde est faible, vous avez besoin d’argent ?',
      'it': 'Il tuo saldo sta per esaurirsi, hai bisogno di contanti?',
    },
    'y0l1nxrn': {
      'en': '€250 is available to borrow',
      'de': 'Es stehen 250 € zum Ausleihen zur Verfügung',
      'es': '250 € están disponibles para pedir prestado',
      'fr': '250 € sont disponibles à l\'emprunt',
      'it': 'È possibile prendere in prestito 250 euro',
    },
    'gazbfi8t': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '6arysg2w': {
      'en': 'Available credit',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    '7dknyb82': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'y3i1qasf': {
      'en': 'Pay',
      'de': 'Zahlen',
      'es': 'Pagar',
      'fr': 'Payer',
      'it': 'Paga',
    },
    'x01s4x5z': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'n1pwxpm3': {
      'en': 'Used:',
      'de': 'Gebraucht:',
      'es': 'Usado:',
      'fr': 'Utilisé:',
      'it': 'Usato:',
    },
    '4nis6z8k': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'dl16fyby': {
      'en': 'Your limit:',
      'de': 'Ihr Limit:',
      'es': 'Tu límite:',
      'fr': 'Votre limite :',
      'it': 'Il tuo limite:',
    },
    'i6pnlzqj': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'rsk5x0o1': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ldfmqs7a': {
      'en': 'Add another account',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'knu9sowp': {
      'en': 'Upcoming Payments',
      'de': 'Anstehende Zahlungen',
      'es': 'Próximos pagos',
      'fr': 'Paiements à venir',
      'it': 'Prossimi pagamenti',
    },
    'vk1p56bs': {
      'en': 'View more',
      'de': 'Mehr sehen',
      'es': 'Ver más',
      'fr': 'Voir plus',
      'it': 'Visualizza altro',
    },
    'ym1pqwyp': {
      'en': 'You don’t have any upcoming payments',
      'de': 'Sie haben noch keine Zahlungen',
      'es': 'Aún no tienes ningún pago',
      'fr': 'Vous n\'avez pas encore de paiement',
      'it': 'Non hai ancora alcun pagamento',
    },
    'nikh8gqy': {
      'en': 'Payment ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '4l9kmjq0': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    '8glnndbx': {
      'en': 'Remaining',
      'de': 'Übrig',
      'es': 'Restante',
      'fr': 'Restant',
      'it': 'Residuo',
    },
    '3rxxe4vn': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
    '4qqblr73': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'hu97uzz5': {
      'en': 'Limit',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '3gnwqphy': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'it': 'Profilo',
    },
    'tmjr66ds': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // welcome
  {
    '8xos3obn': {
      'en': 'No Interest rate',
      'de': 'Kein Zinssatz',
      'es': 'Sin tasa de interés',
      'fr': 'Pas de taux d\'intérêt',
      'it': 'Nessun tasso di interesse',
    },
    'fshd2y22': {
      'en':
          'Tight on cash and tired of asking friends to \ncover you? EuroGet will advance you up to €500 when you need it most.',
      'de':
          'Ich habe wenig Geld und bin es leid, Freunde darum zu bitten\nSchütze dich? Mit EuroGet erhalten Sie bis zu 500 €\nwenn Sie es am meisten brauchen.',
      'es':
          'Con poco dinero y cansado de pedirle a sus amigos que\n¿cubrirte? EuroGet le ofrece hasta 500 €\nCuando más lo necesites.',
      'fr':
          'À court d\'argent et fatigué de demander à des amis de\nvous couvrir? EuroGet vous fera flotter jusqu\'à 500 €\nquand tu en as le plus besoin.',
      'it':
          'A corto di soldi e stanco di chiederlo agli amici\ncoprirti? EuroGet ti farà galleggiare fino a €500\nquando ne hai più bisogno.',
    },
    '6wd27x4g': {
      'en': 'No credit checks',
      'de': 'Keine Bonitätsprüfung',
      'es': 'Sin verificaciones de crédito',
      'fr': 'Aucune vérification de crédit',
      'it': 'Nessun controllo del credito',
    },
    'ln1xr61p': {
      'en':
          'Get cash within 5 minutes* of downloading \nthe app. Keep your credit score a secret. No \ncredit score or security deposit to qualify',
      'de':
          'Erhalten Sie Bargeld innerhalb von 5 Minuten* nach dem Herunterladen\ndie App. Halten Sie Ihre Kreditwürdigkeit geheim. NEIN\nBonitätsbewertung oder Kaution, um sich zu qualifizieren',
      'es':
          'Obtenga efectivo dentro de los 5 minutos* posteriores a la descarga\nla aplicación. Mantenga su puntaje crediticio en secreto. No\npuntaje de crédito o depósito de seguridad para calificar',
      'fr':
          'Obtenez de l\'argent dans les 5 minutes* suivant le téléchargement\nl\'application. Gardez votre pointage de crédit secret. Non\npointage de crédit ou dépôt de garantie pour être admissible',
      'it':
          'Ottieni contanti entro 5 minuti* dal download\nl\'applicazione. Mantieni segreto il tuo punteggio di credito. NO\npunteggio di credito o deposito cauzionale per qualificarsi',
    },
    '5kp3ief1': {
      'en': 'Borrow up to 500€',
      'de': 'Leihen Sie bis zu 500€',
      'es': 'Préstamo hasta 500€',
      'fr': 'Emprunter jusqu\'à 500€',
      'it': 'Prendi in prestito fino a 500€',
    },
    'w626ksps': {
      'en':
          'Need extra cash to make it to your next \npaycheck? We’ve got your back. Instant \ndelivery available.',
      'de':
          'Benötigen Sie zusätzliches Geld, um es zu Ihrem nächsten zu schaffen\nGehaltsscheck? Wir stehen Ihnen zur Seite. Sofortig\nLieferung möglich.',
      'es':
          'Necesita dinero extra para llegar a su próximo\ncheque de pago? Te cubrimos. Instante\nentrega disponible.',
      'fr':
          'Besoin d\'argent supplémentaire pour vous rendre à votre prochain\nchèque de paie ? Nous vous soutenons. Instantané\nlivraison disponible.',
      'it':
          'Hai bisogno di soldi extra per arrivare al tuo prossimo\nbusta paga? Ti copriamo le spalle. Immediato\nconsegna disponibile.',
    },
    'toghbprz': {
      'en': 'Sign up',
      'de': 'Melden Sie sich an',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'it': 'Iscrizione',
    },
    'bhu1aax7': {
      'en': 'Log in',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'it': 'Login',
    },
    '62a4cvj3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // signup
  {
    '2xxnbc3m': {
      'en': 'Welcome to EuroGet',
      'de': 'Willkommen bei EuroGet',
      'es': 'Bienvenido a EuroGet',
      'fr': 'Bienvenue sur EuroGet',
      'it': 'Benvenuti in EuroGet',
    },
    'yki30uye': {
      'en': 'Please enter your email and create a password in order to proceed',
      'de':
          'Teilen Sie uns Ihre E-Mail-Adresse mit und wir senden Ihnen einen Login-Link',
      'es':
          'Díganos la dirección de correo electrónico y le enviaremos un enlace de inicio de sesión',
      'fr':
          'Donnez-nous l\'adresse e-mail et nous vous enverrons un lien de connexion',
      'it': 'Comunicaci l\'indirizzo email e ti invieremo un link di accesso',
    },
    'lrpn599h': {
      'en': 'Mail',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Mail',
      'it': 'Posta',
    },
    'pkqrb8zm': {
      'en': 'youremail@gmail.com',
      'de': 'youremail@gmail.com',
      'es': 'tucorreo electrónico@gmail.com',
      'fr': 'votre email@gmail.com',
      'it': 'tuaemail@gmail.com',
    },
    'y386io2l': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'auwfmpyj': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'ecvvm0k7': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'nw3hr770': {
      'en': 'or',
      'de': 'oder',
      'es': 'o',
      'fr': 'ou',
      'it': 'O',
    },
    '6d3800fq': {
      'en': 'Sign up with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'it': 'Continua con Apple',
    },
    '60k06iyp': {
      'en': 'Already have an account? Log in',
      'de': 'Sie haben bereits ein Konto? Anmeldung',
      'es': '¿Ya tienes una cuenta? Acceso',
      'fr': 'Vous avez déjà un compte? Se connecter',
      'it': 'Hai già un account? Login',
    },
    'kd8xoczu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // login
  {
    'vslyyb8f': {
      'en': 'Welcome back',
      'de': 'Willkommen bei EuroGet',
      'es': 'Bienvenido a EuroGet',
      'fr': 'Bienvenue sur EuroGet',
      'it': 'Benvenuti in EuroGet',
    },
    '65arx6p1': {
      'en': 'Please enter your email and password below',
      'de':
          'Teilen Sie uns Ihre E-Mail-Adresse mit und wir senden Ihnen einen Login-Link',
      'es':
          'Díganos la dirección de correo electrónico y le enviaremos un enlace de inicio de sesión',
      'fr':
          'Donnez-nous l\'adresse e-mail et nous vous enverrons un lien de connexion',
      'it': 'Comunicaci l\'indirizzo email e ti invieremo un link di accesso',
    },
    '9vzvdqwj': {
      'en': 'Mail',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Mail',
      'it': 'Posta',
    },
    'q2bz7fky': {
      'en': 'youremail@gmail.com',
      'de': 'youremail@gmail.com',
      'es': 'tucorreo electrónico@gmail.com',
      'fr': 'votre email@gmail.com',
      'it': 'tuaemail@gmail.com',
    },
    '098t4dx7': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'u6pbwd52': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'plbuwu04': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ny9qksep': {
      'en': 'or',
      'de': 'oder',
      'es': 'o',
      'fr': 'ou',
      'it': 'O',
    },
    'es6qfl8p': {
      'en': 'Login with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'it': 'Continua con Apple',
    },
    'hzid01oc': {
      'en': 'Don\'t have an account yet? Sign up',
      'de': 'Sie haben noch kein Konto? Melden Sie sich an',
      'es': '¿Aún no tienes una cuenta? Inscribirse',
      'fr': 'Vous n\'avez pas encore de compte? S\'inscrire',
      'it': 'Non hai ancora un conto? Iscrizione',
    },
    '2p4dx5lq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // checkEmail
  {
    '5r7sp1v0': {
      'en': 'Check your email',
      'de': 'Check deine E-Mails',
      'es': 'Consultar su correo electrónico',
      'fr': 'Vérifiez votre courrier électronique',
      'it': 'Controlla la tua email',
    },
    '77e26qdb': {
      'en': 'We just send verification email to ',
      'de': 'Wir senden einfach eine E-Mail an',
      'es': 'Simplemente enviamos un correo electrónico a',
      'fr': 'Nous envoyons simplement un e-mail à',
      'it': 'Inviamo semplicemente un\'e-mail a',
    },
    'n7dp26c1': {
      'en': 'Open Email App',
      'de': 'Öffnen Sie die E-Mail-App',
      'es': 'Abrir aplicación de correo electrónico',
      'fr': 'Ouvrir l\'application de messagerie',
      'it': 'Apri l\'app di posta elettronica',
    },
    'kt6rpd5u': {
      'en': 'I didn’t receive my email',
      'de': 'Ich habe meine E-Mail nicht erhalten',
      'es': 'No recibí mi correo electrónico',
      'fr': 'Je n\'ai pas reçu mon email',
      'it': 'Non ho ricevuto la mia email',
    },
    'sjrfo2ru': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // didntReceiveCode
  {
    'mn7yp7ly': {
      'en': 'Din’t get a code?',
      'de': 'Sie erhalten keinen Code?',
      'es': '¿No recibes un código?',
      'fr': 'Vous n\'avez pas de code ?',
      'it': 'Non hai ricevuto il codice?',
    },
    'y4lse793': {
      'en': 'If you didn’t get a code, please try  one of the options below',
      'de':
          'Wenn Sie keinen Code erhalten haben, probieren Sie bitte eine der folgenden Optionen aus',
      'es': 'Si no recibió un código, pruebe una de las siguientes opciones',
      'fr':
          'Si vous n\'avez pas reçu de code, veuillez essayer l\'une des options ci-dessous',
      'it': 'Se non hai ricevuto un codice, prova una delle opzioni seguenti',
    },
    'ls7n3t6z': {
      'en': 'Send Again',
      'de': 'Nochmals senden',
      'es': 'Enviar de nuevo',
      'fr': 'Envoyer à nouveau',
      'it': 'Invia di nuovo',
    },
    'sbwxaahy': {
      'en': 'Change Email',
      'de': 'Ändern Sie die E-Mail',
      'es': 'Cambiar e-mail',
      'fr': 'Changer l\'e-mail',
      'it': 'Cambia email',
    },
    'cn7ftmg3': {
      'en': 'Contact Support',
      'de': 'Kontaktieren Sie Support',
      'es': 'Soporte de contacto',
      'fr': 'Contactez le support',
      'it': 'Contatta il supporto',
    },
    'w29oov9a': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // linkResend
  {
    'msipf5v7': {
      'en': 'Link has been resent',
      'de': 'Link erneut gesendet',
      'es': 'Enlace reenviado',
      'fr': 'Lien renvoyé',
      'it': 'Collegamento rinviato',
    },
    'arc4atxw': {
      'en': 'We just send an email to ',
      'de': 'Wir senden einfach eine E-Mail an',
      'es': 'Simplemente enviamos un correo electrónico a',
      'fr': 'Nous envoyons simplement un e-mail à',
      'it': 'Inviamo semplicemente un\'e-mail a',
    },
    'so4fom6o': {
      'en': 'Open Email App',
      'de': 'Öffnen Sie die E-Mail-App',
      'es': 'Abrir aplicación de correo electrónico',
      'fr': 'Ouvrir l\'application de messagerie',
      'it': 'Apri l\'app di posta elettronica',
    },
    'y3l4fwye': {
      'en': 'I didn’t receive my email',
      'de': 'Ich habe meine E-Mail nicht erhalten',
      'es': 'No recibí mi correo electrónico',
      'fr': 'Je n\'ai pas reçu mon email',
      'it': 'Non ho ricevuto la mia email',
    },
    'syz4zs8w': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // kycSDK
  {
    'iaso2wxx': {
      'en': 'Please complete the KYC processs',
      'de': 'Willkommen bei EuroGet: Vervollständigen Sie Ihr Profil',
      'es': 'Bienvenido a EuroGet: completa tu perfil',
      'fr': 'Bienvenue sur EuroGet : complétez votre profil',
      'it': 'Benvenuto su EuroGet: completa il tuo profilo',
    },
    'i9bhdg49': {
      'en':
          'In order to get a cash advance we need to do a quick KYC, it won\'t take more than 3 minutes',
      'de':
          'Die Fertigstellung jedes Abschnitts sollte nur ein paar Minuten dauern',
      'es':
          'Cada sección solo debería tomar un par de minutos para completarse.',
      'fr':
          'Chaque section ne devrait prendre que quelques minutes à compléter',
      'it':
          'Il completamento di ciascuna sezione dovrebbe richiedere solo un paio di minuti',
    },
    'kc5ar1uf': {
      'en': 'Get Link',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    'cdv94qd8': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // personalinformationLocation
  {
    'gnflf2iy': {
      'en': 'Where\'re you based?',
      'de': 'Wo ist Ihr Standort?',
      'es': '¿Cuál es tu ubicación?',
      'fr': 'Quelle est ta position ?',
      'it': 'Qual è la tua posizione?',
    },
    'w0cvzl16': {
      'en': 'AML laws require us to ask such  a question, thank you',
      'de':
          'Das Bundesgesetz verlangt von uns, eine solche Frage zu stellen, vielen Dank',
      'es': 'La ley federal nos exige que hagamos esa pregunta, gracias.',
      'fr': 'La loi fédérale nous oblige à poser une telle question, merci',
      'it':
          'La legge federale ci impone di porre una domanda del genere, grazie',
    },
    'mg5ph8ve': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
      'it': 'Paese',
    },
    'yzjwcm9q': {
      'en': 'England, France etc.',
      'de': 'England, Frankreich usw.',
      'es': 'Inglaterra, Francia, etc.',
      'fr': 'Angleterre, France, etc.',
      'it': 'Inghilterra, Francia ecc.',
    },
    'jvjwfu0s': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
      'it': 'Città',
    },
    '2vk6lsoo': {
      'en': 'London',
      'de': 'London',
      'es': 'Londres',
      'fr': 'Londres',
      'it': 'Londra',
    },
    '8cpzunle': {
      'en': 'Address',
      'de': 'Adresse',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'it': 'Indirizzo',
    },
    'hdh7npzj': {
      'en': '94 The Avenue, WC48, 1IU',
      'de': '94 The Avenue, WC48, 1IU',
      'es': '94 La Avenida, WC48, 1IU',
      'fr': '94 L\'Avenue, WC48, 1IU',
      'it': '94 The Avenue, WC48, 1IU',
    },
    'jetw0w5i': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '8nzjzsjl': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // personalinformationName
  {
    '5y281zic': {
      'en': 'What’s your name?',
      'de': 'Wie heißen Sie?',
      'es': '¿Cómo te llamas?',
      'fr': 'Quel est ton nom?',
      'it': 'Come ti chiami?',
    },
    '2mppjc85': {
      'en': 'AML laws require us to ask such  a question, thank you',
      'de':
          'Das Bundesgesetz verlangt von uns, eine solche Frage zu stellen, vielen Dank',
      'es': 'La ley federal nos exige que hagamos esa pregunta, gracias.',
      'fr': 'La loi fédérale nous oblige à poser une telle question, merci',
      'it':
          'La legge federale ci impone di porre una domanda del genere, grazie',
    },
    '3kclyrmx': {
      'en': 'First name',
      'de': 'Vorname',
      'es': 'Nombre de pila',
      'fr': 'Prénom',
      'it': 'Nome di battesimo',
    },
    'db2qyurf': {
      'en': 'Edward',
      'de': 'Eduard',
      'es': 'Eduardo',
      'fr': 'Édouard',
      'it': 'Edoardo',
    },
    'ycy64q0n': {
      'en': 'Last name',
      'de': 'Familienname, Nachname',
      'es': 'Apellido',
      'fr': 'Nom de famille',
      'it': 'Cognome',
    },
    'l0x1n1f2': {
      'en': 'Norton',
      'de': 'Norton',
      'es': 'norton',
      'fr': 'Norton',
      'it': 'Norton',
    },
    'ajq2xxrt': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'vdxwmoxx': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // enableNotifications
  {
    '9bkpzi1s': {
      'en': 'Enable Notifications',
      'de': 'Benachrichtigungen aktivieren',
      'es': 'Permitir notificaciones',
      'fr': 'Activer les notifications',
      'it': 'Attivare le notifiche',
    },
    '9kkpm4r3': {
      'en':
          'Maintain your financial  safety  by getting alerts on upcoming  payments and\n bank connection statuses',
      'de':
          'Sorgen Sie für Ihre finanzielle Gesundheit und Sicherheit, indem Sie Benachrichtigungen zu Einkäufen, verdienten Prämien und anstehenden Kreditrechnungen erhalten',
      'es':
          'Mantenga su salud y seguridad financiera recibiendo alertas sobre compras, recompensas obtenidas y próximas facturas de crédito.',
      'fr':
          'Maintenez votre santé et votre sécurité financières en recevant des alertes sur les achats, les récompenses gagnées et les factures de crédit à venir',
      'it':
          'Mantieni la tua salute e sicurezza finanziaria ricevendo avvisi sugli acquisti, sui premi guadagnati e sulle fatture di credito imminenti',
    },
    'z62plqmz': {
      'en': 'Enable',
      'de': 'Aktivieren',
      'es': 'Permitir',
      'fr': 'Activer',
      'it': 'Abilitare',
    },
    '7xj5lzby': {
      'en': 'Maybe later',
      'de': 'Vielleicht später',
      'es': 'Quizas mas tarde',
      'fr': 'Peut-être plus tard',
      'it': 'Forse più tardi',
    },
    'bddfmq5s': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // membershipBanner
  {
    'fw1qmagx': {
      'en': 'Unlock 500€  for just 9.99€!',
      'de': 'Schalten Sie 500 € für nur 9,99 € frei!',
      'es': '¡Desbloquea 500€ por sólo 9,99€!',
      'fr': 'Débloquez 500€ pour seulement 9,99€ !',
      'it': 'Sblocca 500€ a soli 9,99€!',
    },
    'qrntkp0l': {
      'en':
          'Prices may rise for re-subscribers. Lock in your current price and keep access?',
      'de':
          'Für Wiederabonnenten können sich die Preise erhöhen. Aktuellen Preis festlegen und Zugriff behalten?',
      'es':
          'Los precios pueden aumentar para los nuevos suscriptores. ¿Fijar su precio actual y mantener el acceso?',
      'fr':
          'Les prix peuvent augmenter pour les réabonnés. Verrouiller votre prix actuel et conserver l\'accès ?',
      'it':
          'I prezzi potrebbero aumentare per i nuovi abbonati. Bloccare il prezzo attuale e mantenere l\'accesso?',
    },
    '54x989zv': {
      'en': 'No credit checks',
      'de': 'Keine Bonitätsprüfung',
      'es': 'Sin verificaciones de crédito',
      'fr': 'Aucune vérification de crédit',
      'it': 'Nessun controllo del credito',
    },
    's2x97o7w': {
      'en': 'No interest ',
      'de': 'Kein Interesse',
      'es': 'No hay interés',
      'fr': 'Pas d\'intérêt',
      'it': 'Nessun interesse',
    },
    '1hf88d8v': {
      'en': '1 month free trial',
      'de': '1 Monat kostenlose Testversion',
      'es': '1 mes de prueba gratis',
      'fr': '1 mois d\'essai gratuit',
      'it': '1 mese di prova gratuita',
    },
    'z1kqp584': {
      'en': 'Borrow up to 500€',
      'de': 'Leihen Sie bis zu 500€',
      'es': 'Préstamo hasta 500€',
      'fr': 'Emprunter jusqu\'à 500€',
      'it': 'Prendi in prestito fino a 500€',
    },
    'b90szfv6': {
      'en': 'AI overdraft protection',
      'de': 'Überziehungsschutz',
      'es': 'Proteccion DE sobregiro',
      'fr': 'Protection contre les découverts',
      'it': 'Protezione dallo scoperto',
    },
    'o7a3ctvv': {
      'en': '24/5 support',
      'de': 'Support rund um die Uhr',
      'es': 'Soporte 24 horas al día, 7 días a la semana',
      'fr': 'Assistance 24h/24 et 7j/7',
      'it': 'Supporto 24 ore su 24, 7 giorni su 7',
    },
    'o4s1ngxm': {
      'en': 'Get started',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '745uqbhr': {
      'en': 'Auto-renewable. Cancel anytime.',
      'de': 'Automatisch erneuerbar. Jederzeit kündbar.',
      'es': 'Renovable automáticamente. Cancele en cualquier momento.',
      'fr': 'Auto-renouvelable. Annulez à tout moment.',
      'it': 'Rinnovabile automaticamente. Annulla in qualsiasi momento.',
    },
    'cln5ht5g': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // membershipOptions
  {
    'zrasiwuz': {
      'en': 'Choose your plan',
      'de': 'Wählen Sie Ihren Plan',
      'es': 'Elige tu plan',
      'fr': 'Choisissez votre forfait',
      'it': 'Scegli il tuo piano',
    },
    'y54uh2ke': {
      'en': 'Choose the option that works best for you',
      'de':
          'Für Wiederabonnenten können sich die Preise erhöhen. Aktuellen Preis festlegen und Zugriff behalten?',
      'es':
          'Los precios pueden aumentar para los nuevos suscriptores. ¿Fijar su precio actual y mantener el acceso?',
      'fr':
          'Les prix peuvent augmenter pour les réabonnés. Verrouiller votre prix actuel et conserver l\'accès ?',
      'it':
          'I prezzi potrebbero aumentare per i nuovi abbonati. Bloccare il prezzo attuale e mantenere l\'accesso?',
    },
    'pmy10tbt': {
      'en': 'Monthly',
      'de': 'Monatlich',
      'es': 'Mensual',
      'fr': 'Mensuel',
      'it': 'Mensile',
    },
    'y1b3ztiw': {
      'en': '€8.99/mo',
      'de': '9,99 €/Monat',
      'es': '9,99€/mes',
      'fr': '9,99 €/mois',
      'it': '€ 9,99/mese',
    },
    'vjs4hsgt': {
      'en': 'Annual',
      'de': 'Jährlich',
      'es': 'Anual',
      'fr': 'Annuel',
      'it': 'Annuale',
    },
    'cgk8v85w': {
      'en': '€84.99/yr',
      'de': '109,99 €/Jahr',
      'es': '109,99 €/año',
      'fr': '109,99 €/an',
      'it': '€ 109,99/anno',
    },
    '0l2cxcf0': {
      'en': 'Save 20%',
      'de': 'Sparen Sie 20 %',
      'es': 'Ahorra 20%',
      'fr': 'Économisez 20 %',
      'it': 'Risparmia il 20%',
    },
    'vasv223g': {
      'en': 'IBAN',
      'de': 'Bezahlverfahren',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
      'it': 'Metodo di pagamento',
    },
    'z5wjrzvf': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'wyddrre0': {
      'en': 'Auto-renewable. Cancel anytime.',
      'de': 'Automatisch erneuerbar. Jederzeit kündbar.',
      'es': 'Renovable automáticamente. Cancele en cualquier momento.',
      'fr': 'Auto-renouvelable. Annulez à tout moment.',
      'it': 'Rinnovabile automaticamente. Annulla in qualsiasi momento.',
    },
    'yj3dqgz3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // checkBankAcoount
  {
    'azmu8pt9': {
      'en': 'Please check  your bank account and  confirm the subscription ',
      'de':
          'Bitte überprüfen Sie Ihr Bankkonto und akzeptieren Sie das Abonnement',
      'es': 'Por favor revisa tu cuenta bancaria y acepta la suscripción.',
      'fr': 'Veuillez vérifier votre compte bancaire et accepter l\'abonnement',
      'it': 'Controlla il tuo conto bancario e accetta l\'abbonamento',
    },
    'kx4y2q7w': {
      'en': 'Thanks',
      'de': 'Aktivieren',
      'es': 'Permitir',
      'fr': 'Activer',
      'it': 'Abilitare',
    },
    '8h4snkh8': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountMembership
  {
    'u0a5h65r': {
      'en': 'Your membership',
      'de': 'Deine Mitgliedschaft',
      'es': 'Su membresía',
      'fr': 'Votre adhésion',
      'it': 'La tua iscrizione',
    },
    '9oxdulsh': {
      'en': 'Next payment ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '1h20kyb4': {
      'en': 'No credit checks',
      'de': 'Keine Bonitätsprüfung',
      'es': 'Sin verificaciones de crédito',
      'fr': 'Aucune vérification de crédit',
      'it': 'Nessun controllo del credito',
    },
    'k42co6li': {
      'en': 'No interest ',
      'de': 'Kein Interesse',
      'es': 'No hay interés',
      'fr': 'Pas d\'intérêt',
      'it': 'Nessun interesse',
    },
    'hnp2okdg': {
      'en': '1 month free trial',
      'de': '1 Monat kostenlose Testversion',
      'es': '1 mes de prueba gratis',
      'fr': '1 mois d\'essai gratuit',
      'it': '1 mese di prova gratuita',
    },
    'c50juxxd': {
      'en': 'Borrow up to 500€',
      'de': 'Leihen Sie bis zu 500€',
      'es': 'Préstamo hasta 500€',
      'fr': 'Emprunter jusqu\'à 500€',
      'it': 'Prendi in prestito fino a 500€',
    },
    'me0ka8oq': {
      'en': 'AI overdraft protection',
      'de': 'Überziehungsschutz',
      'es': 'Proteccion DE sobregiro',
      'fr': 'Protection contre les découverts',
      'it': 'Protezione dallo scoperto',
    },
    'l39xckuj': {
      'en': '24/5 support',
      'de': 'Support rund um die Uhr',
      'es': 'Soporte 24 horas al día, 7 días a la semana',
      'fr': 'Assistance 24h/24 et 7j/7',
      'it': 'Supporto 24 ore su 24, 7 giorni su 7',
    },
    'ttgx4sqr': {
      'en': 'Hello World',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    '2dsztqnm': {
      'en': 'Terms of use',
      'de': 'Nutzungsbedingungen',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
      'it': 'Termini di utilizzo',
    },
    'bnr19cs1': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
      'it': 'FAQ',
    },
    '54xgkhv5': {
      'en': 'Cancel Membership',
      'de': 'Mitgliedschaft kündigen',
      'es': 'Cancelar membresía',
      'fr': 'Annuler l\'adhésion',
      'it': 'Annulla l\'iscrizione',
    },
    'yvbjk8jt': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountCancelMembership
  {
    'xo8wbtt0': {
      'en': 'Sorry you want to go',
      'de': 'Tut mir leid, dass du gehen willst',
      'es': 'Lo siento, quieres ir',
      'fr': 'Désolé tu veux y aller',
      'it': 'Mi dispiace che tu voglia andare',
    },
    '7rzdpby4': {
      'en':
          'Prices may rise for re-subscribers. Lock in your current price and keep access?',
      'de':
          'Für Wiederabonnenten können sich die Preise erhöhen. Aktuellen Preis festlegen und Zugriff behalten?',
      'es':
          'Los precios pueden aumentar para los nuevos suscriptores. ¿Fijar su precio actual y mantener el acceso?',
      'fr':
          'Les prix peuvent augmenter pour les réabonnés. Verrouiller votre prix actuel et conserver l\'accès ?',
      'it':
          'I prezzi potrebbero aumentare per i nuovi abbonati. Bloccare il prezzo attuale e mantenere l\'accesso?',
    },
    'njrhivt6': {
      'en': 'No credit checks',
      'de': 'Keine Bonitätsprüfung',
      'es': 'Sin verificaciones de crédito',
      'fr': 'Aucune vérification de crédit',
      'it': 'Nessun controllo del credito',
    },
    '7qq0bvjv': {
      'en': 'No interest ',
      'de': 'Kein Interesse',
      'es': 'No hay interés',
      'fr': 'Pas d\'intérêt',
      'it': 'Nessun interesse',
    },
    'cwfa3umm': {
      'en': '1 month free trial',
      'de': '1 Monat kostenlose Testversion',
      'es': '1 mes de prueba gratis',
      'fr': '1 mois d\'essai gratuit',
      'it': '1 mese di prova gratuita',
    },
    '0bf6frsv': {
      'en': 'Borrow up to 500€',
      'de': 'Leihen Sie bis zu 500€',
      'es': 'Préstamo hasta 500€',
      'fr': 'Emprunter jusqu\'à 500€',
      'it': 'Prendi in prestito fino a 500€',
    },
    'zm6kg56k': {
      'en': 'AI overdraft protection',
      'de': 'Überziehungsschutz',
      'es': 'Proteccion DE sobregiro',
      'fr': 'Protection contre les découverts',
      'it': 'Protezione dallo scoperto',
    },
    'xhidrbjj': {
      'en': '24/5 support',
      'de': 'Support rund um die Uhr',
      'es': 'Soporte 24 horas al día, 7 días a la semana',
      'fr': 'Assistance 24h/24 et 7j/7',
      'it': 'Supporto 24 ore su 24, 7 giorni su 7',
    },
    'p3dvg3n2': {
      'en': 'Keep Premium',
      'de': 'Behalten Sie Premium',
      'es': 'Mantener prima',
      'fr': 'Conserver la prime',
      'it': 'Mantieni Premium',
    },
    'zahn8xrj': {
      'en': 'Cancel plan',
      'de': 'Plan kündigen',
      'es': 'Cancelar plan',
      'fr': 'Annuler le forfait',
      'it': 'Annulla il piano',
    },
    'rhnnnjbn': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // errorConnect
  {
    'np0294ka': {
      'en': 'Oops! Something went wrong.',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    '9r9stmxy': {
      'en':
          'We encountered an error. Please give it another try, and thank you for your patience!',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    'd7h3uvr1': {
      'en': 'Try again',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '5kiqa0ag': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // connecAnotherAccount
  {
    'averwg7l': {
      'en': 'Please connect another account',
      'de':
          'Bitte überprüfen Sie Ihr Bankkonto und akzeptieren Sie das Abonnement',
      'es': 'Por favor revisa tu cuenta bancaria y acepta la suscripción.',
      'fr': 'Veuillez vérifier votre compte bancaire et accepter l\'abonnement',
      'it': 'Controlla il tuo conto bancario e accetta l\'abbonamento',
    },
    'xcwjrwqj': {
      'en':
          'One of the potential reasons may be: not enough transactions or newly created account',
      'de':
          'Bitte überprüfen Sie Ihr Bankkonto und akzeptieren Sie das Abonnement',
      'es': 'Por favor revisa tu cuenta bancaria y acepta la suscripción.',
      'fr': 'Veuillez vérifier votre compte bancaire et accepter l\'abonnement',
      'it': 'Controlla il tuo conto bancario e accetta l\'abbonamento',
    },
    '09cviqgp': {
      'en': 'Connect',
      'de': 'Aktivieren',
      'es': 'Permitir',
      'fr': 'Activer',
      'it': 'Abilitare',
    },
    '5a63gey3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // payScreenPayAll
  {
    'w272tlbv': {
      'en': 'Checkout',
      'de': 'Bezahlung für alle',
      'es': 'pago para todos',
      'fr': 'Paiement pour tous',
      'it': 'Pagamento per tutti',
    },
    '3xbvp68s': {
      'en': 'List of all advances:',
      'de': 'Liste aller Zahlungen:',
      'es': 'Lista de todos los pagos:',
      'fr': 'Liste de tous les paiements :',
      'it': 'Elenco di tutti i pagamenti:',
    },
    '0m8gqrqq': {
      'en': 'Payment ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'sr0xma13': {
      'en': 'Date',
      'de': 'Zweite Zahlung',
      'es': 'Segundo pago',
      'fr': 'Deuxième paiement',
      'it': 'Secondo pagamento',
    },
    're8vjlwp': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'jqc8nk6n': {
      'en': 'Remaining',
      'de': 'Übrig',
      'es': 'Restante',
      'fr': 'Restant',
      'it': 'Residuo',
    },
    'dwjes5fk': {
      'en': 'Choose another payment method',
      'de': 'Sie haben noch kein Konto? Melden Sie sich an',
      'es': '¿Aún no tienes una cuenta? Inscribirse',
      'fr': 'Vous n\'avez pas encore de compte? S\'inscrire',
      'it': 'Non hai ancora un conto? Iscrizione',
    },
    'atea2gyt': {
      'en': 'Cash Advances',
      'de': 'Kreditbetrag',
      'es': 'Monto del préstamo',
      'fr': 'Montant du prêt',
      'it': 'Ammontare del prestito',
    },
    'normtfgx': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'sdv091ib': {
      'en': 'Commission',
      'de': 'Kommission',
      'es': 'Comisión',
      'fr': 'Commission',
      'it': 'Commissione',
    },
    '8rmj4gpz': {
      'en': '€0.0',
      'de': '0,2 €',
      'es': '0,2€',
      'fr': '0,2 €',
      'it': '€ 0,2',
    },
    'zu55km80': {
      'en': 'Total payment',
      'de': 'Sie bezahlen',
      'es': 'Tu pagas',
      'fr': 'Tu payes',
      'it': 'Tu paghi',
    },
    '4232273m': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '107zvjhf': {
      'en': 'Make a payment',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'jcfirds4': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // loanPreview
  {
    'jxx5mmbo': {
      'en': 'Cash Advance',
      'de': 'Netflix',
      'es': 'netflix',
      'fr': 'Netflix',
      'it': 'Netflix',
    },
    'aqmeobsg': {
      'en': 'Paid',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    'l7drv08v': {
      'en': 'remaining',
      'de': 'übrig',
      'es': 'restante',
      'fr': 'restant',
      'it': 'residuo',
    },
    'lduuxlyd': {
      'en': 'First payment',
      'de': 'Erste Zahlung',
      'es': 'Primer pago',
      'fr': 'Premier paiement',
      'it': 'Prima rata',
    },
    'lis82a0w': {
      'en': 'Second payment',
      'de': 'Zweite Zahlung',
      'es': 'Segundo pago',
      'fr': 'Deuxième paiement',
      'it': 'Secondo pagamento',
    },
    'j2re58dj': {
      'en': 'Third payment',
      'de': 'Dritte Zahlung',
      'es': 'Tercer pago',
      'fr': 'Troisième paiement',
      'it': 'Terzo pagamento',
    },
    'k777qt2v': {
      'en': 'Final payment',
      'de': 'Restzahlung',
      'es': 'Pago final',
      'fr': 'Paiement final',
      'it': 'Pagamento finale',
    },
    'kdym6ogr': {
      'en': 'Date of issuance',
      'de': 'Datum der Ausstellung',
      'es': 'Fecha de emisión',
      'fr': 'Date d\'émission',
      'it': 'Data di emissione',
    },
    'gkh6qgok': {
      'en': 'Sum taken',
      'de': 'Summe genommen',
      'es': 'suma tomada',
      'fr': 'Somme prélevée',
      'it': 'Somma presa',
    },
    '99jnt55e': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '4ysqp9p0': {
      'en': 'Outstanding debt',
      'de': 'Restschuld',
      'es': 'Deuda pendiente',
      'fr': 'Encours de la dette',
      'it': 'Debito in sospeso',
    },
    'ulwf15m7': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'a2i8ounl': {
      'en': 'Advance  terms',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'c39ktthw': {
      'en': 'Advance verification',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ocnhln2m': {
      'en': 'Pay off the installment',
      'de': 'Bezahlen',
      'es': 'Realizar un pago',
      'fr': 'Effectuer un paiement',
      'it': 'Effettua un pagamento',
    },
    'c8rwpc1g': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // payScreenPayment
  {
    'nnw99utb': {
      'en': 'Checkout',
      'de': 'Netflix-Zahlung',
      'es': 'pago netflix',
      'fr': 'Paiement Netflix',
      'it': 'Pagamento Netflix',
    },
    'p4zbqqu4': {
      'en': 'Check the data',
      'de': 'Überprüfen Sie die Daten',
      'es': 'Comprueba los datos',
      'fr': 'Vérifiez les données',
      'it': 'Controlla i dati',
    },
    'r8akzpzw': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'gtgvskkp': {
      'en': ' ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ojgqtmyd': {
      'en': 'Account',
      'de': 'Konto',
      'es': 'Cuenta',
      'fr': 'Compte',
      'it': 'Account',
    },
    '0njc80ni': {
      'en': 'Choose another payment method',
      'de': 'Sie haben noch kein Konto? Melden Sie sich an',
      'es': '¿Aún no tienes una cuenta? Inscribirse',
      'fr': 'Vous n\'avez pas encore de compte? S\'inscrire',
      'it': 'Non hai ancora un conto? Iscrizione',
    },
    '3dfa005y': {
      'en': 'Cash Advance',
      'de': 'Kreditbetrag',
      'es': 'Monto del préstamo',
      'fr': 'Montant du prêt',
      'it': 'Ammontare del prestito',
    },
    'kz5hiqzi': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'gdtim4xm': {
      'en': 'Commission',
      'de': 'Kommission',
      'es': 'Comisión',
      'fr': 'Commission',
      'it': 'Commissione',
    },
    'ub2kog3s': {
      'en': '€0.0',
      'de': '0,2 €',
      'es': '0,2€',
      'fr': '0,2 €',
      'it': '€ 0,2',
    },
    '4y9f6jv0': {
      'en': 'You pay',
      'de': 'Sie bezahlen',
      'es': 'Tu pagas',
      'fr': 'Tu payes',
      'it': 'Tu paghi',
    },
    'qw3xtqr4': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'sjgh51w6': {
      'en': 'Pay',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '0i4dputm': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // errorPayment
  {
    'ntihziqv': {
      'en': 'Please try again',
      'de': 'Bitte versuche es erneut',
      'es': 'Inténtalo de nuevo',
      'fr': 'Veuillez réessayer',
      'it': 'Per favore riprova',
    },
    'y5cubtpa': {
      'en': 'Something went wrong, maybe  the entered data was invalid.',
      'de':
          'Etwas ist schief gelaufen, möglicherweise sind die Daten ungültig.',
      'es': 'Algo salió mal, tal vez los datos no sean válidos.',
      'fr':
          'Quelque chose s\'est mal passé, les données ne sont peut-être pas valides.',
      'it': 'Qualcosa è andato storto, forse i dati non sono validi.',
    },
    'tuc48r1h': {
      'en': 'Try again',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'e91ehqxo': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // emptyLoans
  {
    'fs1e05j3': {
      'en': 'You don\'t have  any payments yet',
      'de': 'Sie haben keine Zahlungen',
      'es': 'No tienes ningún pago',
      'fr': 'Vous n\'avez aucun paiement',
      'it': 'Non hai alcun pagamento',
    },
    's5rd9965': {
      'en': 'Payments will show up  if you take out a loan',
      'de': 'Zahlungen werden angezeigt, wenn Sie einen Kredit aufnehmen',
      'es': 'Los pagos aparecerán si solicita un préstamo',
      'fr': 'Les paiements apparaîtront si vous contractez un prêt',
      'it': 'I pagamenti verranno visualizzati se si richiede un prestito',
    },
    'uahc0zdz': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '8ftvpiui': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // notificationsDefault
  {
    '4iv42mbd': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'it': 'Notifiche',
    },
    'h23qestu': {
      'en': 'Today',
      'de': 'Heute',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
      'it': 'Oggi',
    },
    'dljperj9': {
      'en': 'Fancy',
      'de': 'Schick',
      'es': 'Elegante',
      'fr': 'Fantaisie',
      'it': 'Fantasia',
    },
    'wktpy8fw': {
      'en': '\$200',
      'de': '200 \$',
      'es': '\$200',
      'fr': '200 \$',
      'it': '\$ 200',
    },
    '81bg1guo': {
      'en': 'Yesterday',
      'de': 'Gestern',
      'es': 'Ayer',
      'fr': 'Hier',
      'it': 'Ieri',
    },
    'uhzfh5te': {
      'en':
          'A grace period is a period immediately after the deadline for an obligation during which a late fee...',
      'de':
          'Eine Nachfrist ist ein Zeitraum unmittelbar nach Ablauf der Frist für eine Verpflichtung, in dem eine verspätete Gebühr...',
      'es':
          'Un período de gracia es un período inmediatamente posterior a la fecha límite de una obligación durante el cual se cobra un recargo por mora...',
      'fr':
          'Un délai de grâce est une période immédiatement après l\'échéance d\'une obligation pendant laquelle des frais de retard...',
      'it':
          'Un periodo di grazia è un periodo immediatamente successivo alla scadenza di un obbligo durante il quale una penale per il ritardo...',
    },
    'e0qzrhvs': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // notificationsOpened
  {
    'vo5df87f': {
      'en': 'Fancy',
      'de': 'Schick',
      'es': 'Elegante',
      'fr': 'Fantaisie',
      'it': 'Fantasia',
    },
    '1ijigq9c': {
      'en': '\$200',
      'de': '200 \$',
      'es': '\$200',
      'fr': '200 \$',
      'it': '\$ 200',
    },
    'k4wz4h4t': {
      'en':
          'A grace period is a period immediately after the deadline for an obligation during which  a late fee, or other action that would have been taken as a result of failing to meet  the deadline, is waived provided  that the obligation is satisfied  during the grace period.',
      'de':
          'Eine Nachfrist ist ein Zeitraum unmittelbar nach Ablauf der Frist für eine Verpflichtung, in dem auf eine Verzugsgebühr oder andere Maßnahmen, die aufgrund der Nichteinhaltung der Frist ergriffen worden wären, verzichtet wird, sofern die Verpflichtung während der Nachfrist erfüllt wird.',
      'es':
          'Un período de gracia es un período inmediatamente después de la fecha límite para una obligación durante el cual se renuncia a un cargo por pago atrasado, u otra acción que se habría tomado como resultado del incumplimiento del plazo, siempre que la obligación se cumpla durante el período de gracia.',
      'fr':
          'Un délai de grâce est une période immédiatement après la date limite d\'une obligation pendant laquelle des frais de retard, ou toute autre mesure qui aurait été prise en raison du non-respect du délai, sont annulés à condition que l\'obligation soit satisfaite pendant le délai de grâce.',
      'it':
          'Un periodo di grazia è un periodo immediatamente successivo alla scadenza di un\'obbligazione durante il quale si rinuncia a pagare una penalità per il ritardo, o altra azione che sarebbe stata intrapresa a seguito del mancato rispetto della scadenza, a condizione che l\'obbligazione sia soddisfatta durante il periodo di grazia.',
    },
    'vedbjgil': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
      'it': 'Vicino',
    },
    'rxiy6fjf': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountDefault
  {
    '5n7vrqkb': {
      'en': 'JS',
      'de': 'JS',
      'es': 'js',
      'fr': 'JS',
      'it': 'JS',
    },
    'jrcsvwei': {
      'en': ' ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'elk67g00': {
      'en': 'Joined ',
      'de': 'Beigetreten',
      'es': 'Unido',
      'fr': 'Rejoint',
      'it': 'Partecipato',
    },
    'f62chf3m': {
      'en': 'Upgrade your account to PRO',
      'de': 'Aktualisieren Sie Ihr Konto auf PRO',
      'es': 'Actualice su cuenta a PRO',
      'fr': 'Mettez à niveau votre compte vers PRO',
      'it': 'Aggiorna il tuo account a PRO',
    },
    'o2gp1azu': {
      'en': 'General',
      'de': 'Allgemein',
      'es': 'General',
      'fr': 'Général',
      'it': 'Generale',
    },
    'oe9b3u26': {
      'en': 'Personal information',
      'de': 'Persönliche Angaben',
      'es': 'Informacion personal',
      'fr': 'Informations personnelles',
      'it': 'Informazione personale',
    },
    '849rqxim': {
      'en': 'Membership',
      'de': 'Mitgliedschaft',
      'es': 'Afiliación',
      'fr': 'Adhésion',
      'it': 'Appartenenza',
    },
    'qgmww3xa': {
      'en': 'Feedback',
      'de': 'Rückmeldung',
      'es': 'Comentario',
      'fr': 'Retour',
      'it': 'Feedback',
    },
    'a91qht8m': {
      'en': 'Usefull pages',
      'de': 'Nützliche Seiten',
      'es': 'Paginas utiles',
      'fr': 'Pages utiles',
      'it': 'Pagine utili',
    },
    'roqssc0a': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'it': 'Supporto',
    },
    'f6c8fhb1': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
      'it': 'FAQ',
    },
    'pjf9cmtq': {
      'en': 'About us',
      'de': 'Über uns',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
      'it': 'Chi siamo',
    },
    'l5edt13o': {
      'en': 'Contact details',
      'de': 'Kontaktdetails',
      'es': 'Detalles de contacto',
      'fr': 'Détails du contact',
      'it': 'Dettagli del contatto',
    },
    '93edk9yo': {
      'en': 'Privacy policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'Política de privacidad',
      'fr': 'Politique de confidentialité',
      'it': 'Politica sulla riservatezza',
    },
    'nn8v361i': {
      'en': 'Terms of use',
      'de': 'Nutzungsbedingungen',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
      'it': 'Termini di utilizzo',
    },
    'ubxg2lho': {
      'en': 'Log out',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'it': 'Disconnettersi',
    },
    'n40mlayu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
    'zf8gkd7j': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '5tq99qgu': {
      'en': 'Limit',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '5eha6k30': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'it': 'Profilo',
    },
    'xeft1om3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountPersonalInfo
  {
    'ldtc790p': {
      'en': 'Personal information',
      'de': 'Persönliche Angaben',
      'es': 'Informacion personal',
      'fr': 'Informations personnelles',
      'it': 'Informazione personale',
    },
    '0xtvy93f': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'yrr4cfrn': {
      'en': ' ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '9dbwk1ad': {
      'en': 'Mail',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Mail',
      'it': 'Posta',
    },
    'j5e2rm3f': {
      'en': 'Birthday',
      'de': 'Geburtstag',
      'es': 'Cumpleaños',
      'fr': 'Anniversaire',
      'it': 'Compleanno',
    },
    'pcfsnnzd': {
      'en': 'Tax ID',
      'de': 'Steuer ID',
      'es': 'Identificación del impuesto',
      'fr': 'Numéro d\'identification fiscale',
      'it': 'Codice fiscale',
    },
    'v6xrjzon': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
      'it': 'Paese',
    },
    'f1x8makh': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
      'it': 'Città',
    },
    'phyhgwga': {
      'en': 'Address',
      'de': 'Adresse',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'it': 'Indirizzo',
    },
    '8xkik6b2': {
      'en': 'Zip code',
      'de': 'PLZ',
      'es': 'Código postal',
      'fr': 'Code postal',
      'it': 'Cap',
    },
    '2sgxw54v': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountLanguage
  {
    'q9oe9xxt': {
      'en': 'Select the app language',
      'de': 'Sprache auswählen',
      'es': 'Seleccione el idioma',
      'fr': 'Choisir la langue',
      'it': 'Seleziona la lingua',
    },
    'gdybux8h': {
      'en': 'English',
      'de': 'Englisch',
      'es': 'Inglés',
      'fr': 'Anglais',
      'it': 'Inglese',
    },
    'zkqlzog2': {
      'en': 'English',
      'de': 'Englisch',
      'es': 'Inglés',
      'fr': 'Anglais',
      'it': 'Inglese',
    },
    '8k5yl5fz': {
      'en': 'Deutsch',
      'de': 'Deutsch',
      'es': 'Alemán',
      'fr': 'Allemand',
      'it': 'Tedesco',
    },
    '9dv1967n': {
      'en': 'German',
      'de': 'Deutsch',
      'es': 'Alemán',
      'fr': 'Allemand',
      'it': 'Tedesco',
    },
    '0yn3l925': {
      'en': 'Françias',
      'de': 'Frankreich',
      'es': 'Françias',
      'fr': 'Francias',
      'it': 'Franças',
    },
    '3tansqba': {
      'en': 'French',
      'de': 'Französisch',
      'es': 'Francés',
      'fr': 'Français',
      'it': 'francese',
    },
    'c0hx3vzi': {
      'en': 'Español',
      'de': 'Spanisch',
      'es': 'Español',
      'fr': 'espagnol',
      'it': 'Español',
    },
    'z0897ukl': {
      'en': 'Spanish',
      'de': 'Spanisch',
      'es': 'Español',
      'fr': 'Espagnol',
      'it': 'spagnolo',
    },
    'cn2zapcu': {
      'en': 'Italiano',
      'de': 'Italienisch',
      'es': 'italiano',
      'fr': 'Italien',
      'it': 'Italiano',
    },
    'ywv0588s': {
      'en': 'Italian',
      'de': 'Italienisch',
      'es': 'italiano',
      'fr': 'italien',
      'it': 'Italiano',
    },
    'm9cdpett': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountFeedbackSubmit
  {
    'mc1hd70y': {
      'en': 'Let’s make EuroGet better together',
      'de': 'Lassen Sie uns gemeinsam das Banking besser machen',
      'es': 'Mejoremos juntos la banca',
      'fr': 'Améliorons ensemble les services bancaires',
      'it': 'Miglioriamo insieme il settore bancario',
    },
    'ax3erkd4': {
      'en': 'Help us improve your experience  by sharing your thoughts',
      'de':
          'Helfen Sie uns, Ihr Bankerlebnis zu verbessern, indem Sie uns Ihre Gedanken mitteilen',
      'es':
          'Ayúdanos a mejorar tu experiencia bancaria compartiendo tus pensamientos',
      'fr':
          'Aidez-nous à améliorer votre expérience bancaire en partageant vos réflexions',
      'it':
          'Aiutaci a migliorare la tua esperienza bancaria condividendo i tuoi pensieri',
    },
    'clyp8pg9': {
      'en': 'Start',
      'de': 'Start',
      'es': 'Comenzar',
      'fr': 'Commencer',
      'it': 'Inizio',
    },
    'yeg7bema': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountFeedbackWrite
  {
    'z5194e36': {
      'en': 'Please leave your feedback below',
      'de': 'Danke für Ihre Rückmeldung!',
      'es': '¡Gracias por tus comentarios!',
      'fr': 'Merci pour votre avis!',
      'it': 'Grazie per il tuo feedback!',
    },
    '8duo8ola': {
      'en':
          'An idea, critisism, new feature, product optimization, advice or anything you find fits',
      'de':
          'Es hilft wirklich. Schauen Sie bald wieder vorbei, denn wir würden uns freuen, Ihre Meinung auch in Zukunft noch einmal zu hören',
      'es':
          'Realmente ayuda. Vuelve pronto ya que nos encantaría escuchar tu opinión nuevamente en el futuro.',
      'fr':
          'Cela aide vraiment. Revenez bientôt car nous aimerions entendre à nouveau vos commentaires à l\'avenir',
      'it':
          'Aiuta davvero. Torna presto perché ci piacerebbe sentire di nuovo i tuoi pensieri in futuro',
    },
    '0ndb1zo5': {
      'en': 'Your feedback',
      'de': 'Ihre Rückmeldung',
      'es': 'Tu retroalimentación',
      'fr': 'Vos réactions',
      'it': 'I tuoi commenti',
    },
    'jyky7iy1': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'nqfur6lc': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountFeedbackThanks
  {
    'sbank4vv': {
      'en': 'Thank you  for your feedback!',
      'de': 'Danke für Ihre Rückmeldung!',
      'es': '¡Gracias por tus comentarios!',
      'fr': 'Merci pour votre avis!',
      'it': 'Grazie per il tuo feedback!',
    },
    'iemzdeoj': {
      'en':
          'It really helps. Check back soon as we’d love to hear your thoughts again in the future',
      'de':
          'Es hilft wirklich. Schauen Sie bald wieder vorbei, denn wir würden uns freuen, Ihre Meinung auch in Zukunft noch einmal zu hören',
      'es':
          'Realmente ayuda. Vuelve pronto ya que nos encantaría escuchar tu opinión nuevamente en el futuro.',
      'fr':
          'Cela aide vraiment. Revenez bientôt car nous aimerions entendre à nouveau vos commentaires à l\'avenir',
      'it':
          'Aiuta davvero. Torna presto perché ci piacerebbe sentire di nuovo i tuoi pensieri in futuro',
    },
    'eq8iiri3': {
      'en': 'Okay',
      'de': 'Okay',
      'es': 'Bueno',
      'fr': 'D\'accord',
      'it': 'Va bene',
    },
    'kkc8srd1': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountSupport
  {
    'ljpuefsw': {
      'en': 'Talk to support',
      'de': 'Sprechen Sie mit dem Support',
      'es': 'Habla con soporte',
      'fr': 'Parlez au support',
      'it': 'Parla con il supporto',
    },
    'xmv1tyok': {
      'en': 'Help us improve your experience  by sharing your thoughts',
      'de':
          'Helfen Sie uns, Ihr Bankerlebnis zu verbessern, indem Sie uns Ihre Gedanken mitteilen',
      'es':
          'Ayúdanos a mejorar tu experiencia bancaria compartiendo tus pensamientos',
      'fr':
          'Aidez-nous à améliorer votre expérience bancaire en partageant vos réflexions',
      'it':
          'Aiutaci a migliorare la tua esperienza bancaria condividendo i tuoi pensieri',
    },
    '5e60zuf6': {
      'en': 'Current email',
      'de': 'Aktuelle E-Mail',
      'es': 'Correo electrónico actual',
      'fr': 'Email actuel',
      'it': 'Email corrente',
    },
    'favkfuuq': {
      'en': 'Use another one',
      'de': 'Benutzen Sie ein anderes',
      'es': 'usa otro',
      'fr': 'Utilisez-en un autre',
      'it': 'Usane un altro',
    },
    'h1u5rg5a': {
      'en': 'Add other email',
      'de': 'Andere E-Mail hinzufügen',
      'es': 'Agregar otro correo electrónico',
      'fr': 'Ajouter un autre e-mail',
      'it': 'Aggiungi un\'altra email',
    },
    'wzbe9z30': {
      'en': 'Start',
      'de': 'Start',
      'es': 'Comenzar',
      'fr': 'Commencer',
      'it': 'Inizio',
    },
    'mel3b92d': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountSupportAddNewEmail
  {
    'xjsj6x65': {
      'en': 'Add new email',
      'de': 'Neue E-Mail hinzufügen',
      'es': 'Agregar nuevo correo electrónico',
      'fr': 'Ajouter un nouvel e-mail',
      'it': 'Aggiungi nuova email',
    },
    'ywj9c7e0': {
      'en':
          'A response to your support ticket will be sent to this e-mail address',
      'de':
          'Eine Antwort auf Ihre Bewerbung wird an diese E-Mail-Adresse gesendet',
      'es':
          'Se enviará una respuesta a su solicitud a esta dirección de correo electrónico',
      'fr':
          'Une réponse à votre candidature sera envoyée à cette adresse e-mail',
      'it':
          'Una risposta alla tua candidatura verrà inviata a questo indirizzo e-mail',
    },
    '1qpvm3de': {
      'en': 'Your email',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
      'fr': 'Votre email',
      'it': 'La tua email',
    },
    '7hiwsube': {
      'en': 'youremail@gmail.com',
      'de': 'youremail@gmail.com',
      'es': 'tucorreo electrónico@gmail.com',
      'fr': 'votre email@gmail.com',
      'it': 'tuaemail@gmail.com',
    },
    'ffkwofh5': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'es': 'Confirmar',
      'fr': 'Confirmer',
      'it': 'Confermare',
    },
    '0jf5itsw': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountSupportWrite
  {
    'yugeca1t': {
      'en': 'Describe your issue',
      'de': 'Beschreibe dein Problem',
      'es': 'describe tu problema',
      'fr': 'Décrivez votre problème',
      'it': 'Descriva il suo problema',
    },
    '7jtdjyzl': {
      'en': 'What has happened? We would love to hear that and help',
      'de':
          'Sie können eine Frage zu jedem Thema stellen, das Sie interessiert',
      'es': 'Puedes hacer una pregunta sobre cualquier tema que te interese.',
      'fr':
          'Vous pouvez poser une question sur n\'importe quel sujet qui vous intéresse',
      'it': 'Puoi fare una domanda su qualsiasi argomento che ti interessa',
    },
    'pmocbgjj': {
      'en': 'Write about issue',
      'de': 'Schreiben Sie über das Problem',
      'es': 'Escribir sobre el problema',
      'fr': 'Écrire sur le problème',
      'it': 'Scrivi sul problema',
    },
    '8iy8tmc0': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'cqxnezfv': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountContactDetails
  {
    'rjm57l8h': {
      'en': 'Contact details',
      'de': 'Kontaktdetails',
      'es': 'Detalles de contacto',
      'fr': 'Détails du contact',
      'it': 'Dettagli del contatto',
    },
    'z3b6gtws': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'kktehqi4': {
      'en': 'COZYCODE LTD',
      'de': 'COSYCODE LTD',
      'es': 'COZYCODE LTD',
      'fr': 'COZYCODE LTD',
      'it': 'COZYCODE LTD',
    },
    'ye7vdum7': {
      'en': 'Mail',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Mail',
      'it': 'Posta',
    },
    'ph7avn1x': {
      'en': 'support@euroget.com',
      'de': 'support@euroget.com',
      'es': 'soporte@euroget.com',
      'fr': 'support@euroget.com',
      'it': 'support@euroget.com',
    },
    '2hl3cf2h': {
      'en': 'Country',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
      'it': 'Paese',
    },
    'gah9xkuh': {
      'en': 'England',
      'de': 'England',
      'es': 'Inglaterra',
      'fr': 'Angleterre',
      'it': 'Inghilterra',
    },
    '0lhqsfhw': {
      'en': 'City',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
      'it': 'Città',
    },
    'dcbv6mcy': {
      'en': 'London',
      'de': 'London',
      'es': 'Londres',
      'fr': 'Londres',
      'it': 'Londra',
    },
    'tx31kupf': {
      'en': 'Address',
      'de': 'Adresse',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
      'it': 'Indirizzo',
    },
    '0i0dyy7g': {
      'en': '71-75 Shelton Street',
      'de': '71-75 Shelton Street',
      'es': '71-75 Calle Shelton',
      'fr': '71-75, rue Shelton',
      'it': '71-75 Shelton Street',
    },
    '93ydcrfg': {
      'en': 'Zip code',
      'de': 'PLZ',
      'es': 'Código postal',
      'fr': 'Code postal',
      'it': 'Cap',
    },
    'xzgq2h0k': {
      'en': 'WC2H 9JQ',
      'de': 'WC2H 9JQ',
      'es': 'WC2H 9JQ',
      'fr': 'WC2H 9JQ',
      'it': 'WC2H9JQ',
    },
    'h7wf6gpt': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'it': 'Profilo',
    },
  },
  // limitDefault
  {
    'mawk8bvq': {
      'en': '€100 through 6 back-to-back payments',
      'de': '100 € durch 6 aufeinanderfolgende Zahlungen',
      'es': '100€ a través de 6 pagos consecutivos',
      'fr': '100 € en 6 paiements consécutifs',
      'it': '€ 100 attraverso 6 pagamenti consecutivi',
    },
    '2hbr5u9s': {
      'en': 'Every installment is biweekly',
      'de': 'Jede Rate erscheint zweiwöchentlich',
      'es': 'Cada cuota es quincenal.',
      'fr': 'Chaque versement est bihebdomadaire',
      'it': 'Ogni puntata è bisettimanale',
    },
    'qwftmedt': {
      'en': 'Pay on time 6 times in a row',
      'de': 'Zahlen Sie 6 Mal hintereinander pünktlich',
      'es': 'Pague a tiempo 6 veces seguidas',
      'fr': 'Payez à temps 6 fois de suite',
      'it': 'Paga in tempo 6 volte di seguito',
    },
    'qeg9t9a9': {
      'en': '1st',
      'de': 'Febr',
      'es': 'Feb',
      'fr': 'Fév',
      'it': 'Febbraio',
    },
    'gpgp7j8t': {
      'en': '2nd',
      'de': 'Febr',
      'es': 'Feb',
      'fr': 'Fév',
      'it': 'Febbraio',
    },
    'nkccryp2': {
      'en': '3rd',
      'de': 'Febr',
      'es': 'Feb',
      'fr': 'Fév',
      'it': 'Febbraio',
    },
    't7hgr39i': {
      'en': '4th',
      'de': 'Febr',
      'es': 'Feb',
      'fr': 'Fév',
      'it': 'Febbraio',
    },
    'jmth0k6f': {
      'en': '5th',
      'de': 'Febr',
      'es': 'Feb',
      'fr': 'Fév',
      'it': 'Febbraio',
    },
    'ti49x8na': {
      'en': '6th',
      'de': 'Febr',
      'es': 'Feb',
      'fr': 'Fév',
      'it': 'Febbraio',
    },
    'inbf4x88': {
      'en': 'Stay on track to unlock your creditline increase',
      'de':
          'Bleiben Sie auf dem richtigen Weg, um die Erhöhung Ihres Kreditrahmens freizuschalten',
      'es':
          'Manténgase encaminado para desbloquear el aumento de su línea de crédito',
      'fr':
          'Restez sur la bonne voie pour débloquer l’augmentation de votre ligne de crédit',
      'it':
          'Rimani aggiornato per sbloccare l\'aumento della tua linea di credito',
    },
    '9vyn7mgh': {
      'en': 'Help your future self',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '51rda6p6': {
      'en': 'Set a limit on when we should  fund your account',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'hsrdglmf': {
      'en': 'Set up auto advance',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'gsfgmoc3': {
      'en': 'Auto account refill is set up',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'an0g4ze5': {
      'en': 'FlutterFlow',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'zt2xcnt7': {
      'en': ' - build different.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'lrc0o3hr': {
      'en': 'Hello World ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'lmn3msom': {
      'en': 'Hello World ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'awdvylpj': {
      'en': 'Edit the settings',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'anla9orb': {
      'en': 'What is grace period',
      'de': 'Was ist eine Schonfrist?',
      'es': '¿Qué es el período de gracia?',
      'fr': 'Qu\'est-ce que le délai de grâce',
      'it': 'Cos\'è il periodo di grazia',
    },
    'bjav17lf': {
      'en': 'What is grace period',
      'de': 'Was ist eine Schonfrist?',
      'es': '¿Qué es el período de gracia?',
      'fr': 'Qu\'est-ce que le délai de grâce',
      'it': 'Cos\'è il periodo di grazia',
    },
    '6uhsdxni': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
    'fh6ixo00': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '91rcg59h': {
      'en': 'Limit',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'a9qsgt0c': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'it': 'Profilo',
    },
    'cy7176tw': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // faqOpen
  {
    'agrep5ce': {
      'en': 'What is grace period?',
      'de': 'Was ist eine Schonfrist?',
      'es': '¿Qué es el período de gracia?',
      'fr': 'Qu’est-ce que le délai de grâce ?',
      'it': 'Cos\'è il periodo di grazia?',
    },
    'w33avum3': {
      'en':
          'A grace period is a period immediately after the deadline for an obligation during which  a late fee, or other action that would have been taken as a result of failing to meet  the deadline, is waived provided  that the obligation is satisfied  during the grace period.',
      'de':
          'Eine Nachfrist ist ein Zeitraum unmittelbar nach Ablauf der Frist für eine Verpflichtung, in dem auf eine Verzugsgebühr oder andere Maßnahmen, die aufgrund der Nichteinhaltung der Frist ergriffen worden wären, verzichtet wird, sofern die Verpflichtung während der Nachfrist erfüllt wird.',
      'es':
          'Un período de gracia es un período inmediatamente después de la fecha límite para una obligación durante el cual se renuncia a un cargo por pago atrasado, u otra acción que se habría tomado como resultado del incumplimiento del plazo, siempre que la obligación se cumpla durante el período de gracia.',
      'fr':
          'Un délai de grâce est une période immédiatement après la date limite d\'une obligation pendant laquelle des frais de retard, ou toute autre mesure qui aurait été prise en raison du non-respect du délai, sont annulés à condition que l\'obligation soit satisfaite pendant le délai de grâce.',
      'it':
          'Un periodo di grazia è un periodo immediatamente successivo alla scadenza di un\'obbligazione durante il quale si rinuncia a pagare una penalità per il ritardo, o altra azione che sarebbe stata intrapresa a seguito del mancato rispetto della scadenza, a condizione che l\'obbligazione sia soddisfatta durante il periodo di grazia.',
    },
    'bkpgx9l3': {
      'en': 'Close',
      'de': 'Schließen',
      'es': 'Cerca',
      'fr': 'Fermer',
      'it': 'Vicino',
    },
    'zuhabhkq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // paymentCalculator
  {
    'ovp57nkh': {
      'en': 'Payment calculator',
      'de': 'Zahlungsrechner',
      'es': 'Calculadora de pagos',
      'fr': 'Calculateur de paiement',
      'it': 'Calcolatore dei pagamenti',
    },
    'ibkn65j7': {
      'en':
          'Use the slider to estimate your payment plan for your next Cash Advance with Pay in 4',
      'de':
          'Nutzen Sie den Schieberegler, um Ihren Zahlungsplan für Ihren nächsten Einkauf mit Pay in 4 abzuschätzen',
      'es':
          'Utilice el control deslizante para estimar su plan de pago para su próxima compra con Pago en 4',
      'fr':
          'Utilisez le curseur pour estimer votre plan de paiement pour votre prochain achat avec Pay in 4',
      'it':
          'Utilizza lo slider per stimare il tuo piano di pagamento per il tuo prossimo acquisto con Pay in 4',
    },
    '3diguxgk': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'dzwz7jjg': {
      'en': 'Hello World',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    'bxgzlsxc': {
      'en': 'Payment plan',
      'de': 'Zahlungs Plan',
      'es': 'Plan de pago',
      'fr': 'Plan de paiement',
      'it': 'Piano di pagamento',
    },
    '4li33czt': {
      'en': 'Pay in 4',
      'de': 'Zahlen Sie in 4',
      'es': 'Paga en 4',
      'fr': 'Payer en 4',
      'it': 'Paga in 4',
    },
    '4ibxtosw': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'num9s1it': {
      'en': 'Today',
      'de': 'Heute',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
      'it': 'Oggi',
    },
    '4dfy907m': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'pdcxi4pd': {
      'en': 'In 2 weeks',
      'de': 'Heute',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
      'it': 'Oggi',
    },
    'g5ebvxdg': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'emcsur4a': {
      'en': 'In 4 weeks',
      'de': 'Heute',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
      'it': 'Oggi',
    },
    'isbnh09r': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'rkzj31xg': {
      'en': 'In 6 weeks',
      'de': 'Heute',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
      'it': 'Oggi',
    },
    '3zsql0l5': {
      'en': 'No interest',
      'de': 'Kein Interesse',
      'es': 'No hay interés',
      'fr': 'Pas d\'intérêt',
      'it': 'Nessun interesse',
    },
    'v3ul775e': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    '2alzlngt': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // reachedMaximum
  {
    '9wpuo1hg': {
      'en': 'Reached maximum',
      'de': 'Maximum erreicht',
      'es': 'Máximo alcanzado',
      'fr': 'Maximum atteint',
      'it': 'Raggiunto il massimo',
    },
    'f6xof6dq': {
      'en': 'To make a new loan, please pay off existing cash advances',
      'de': 'Um einen neuen Kredit aufzunehmen, zahlen Sie bitte den Kredit ab',
      'es': 'Para realizar un nuevo préstamo, liquide el préstamo.',
      'fr': 'Pour accorder un nouveau prêt, veuillez rembourser le prêt',
      'it': 'Per fare un nuovo prestito, estinguere il prestito',
    },
    '2uzuv1pb': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '8vrc7a5w': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // SelectBankAccount
  {
    'bz7pmcmo': {
      'en': 'Select bank account',
      'de': 'Bankkonto auswählen',
      'es': 'Seleccionar cuenta bancaria',
      'fr': 'Sélectionnez un compte bancaire',
      'it': 'Seleziona conto bancario',
    },
    'lml4nzuo': {
      'en': 'A direct transfer of funds will be  made from this account',
      'de': 'Auf dieses Konto erfolgt eine direkte Überweisung',
      'es': 'Se realizará una transferencia directa de fondos a esta cuenta.',
      'fr': 'Un transfert direct de fonds sera effectué sur ce compte',
      'it':
          'Verrà effettuato un trasferimento diretto di fondi su questo conto',
    },
    'p4hkzb6s': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '7eftymvt': {
      'en': 'Connection expired reconnect account',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '36881ej8': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // borrowCheckout
  {
    '5kunum32': {
      'en': 'Cash Advance',
      'de': 'Bezahlung für alle',
      'es': 'pago para todos',
      'fr': 'Paiement pour tous',
      'it': 'Pagamento per tutti',
    },
    'fjyn1nio': {
      'en': 'You can choose the transfer methods',
      'de': 'Liste aller Zahlungen:',
      'es': 'Lista de todos los pagos:',
      'fr': 'Liste de tous les paiements :',
      'it': 'Elenco di tutti i pagamenti:',
    },
    'soqmpii2': {
      'en': 'Instant',
      'de': 'Sofortig',
      'es': 'Instante',
      'fr': 'Instantané',
      'it': 'Immediato',
    },
    'jnv0co7d': {
      'en': 'Within 2 hours',
      'de': 'innerhalb von 15 Minuten',
      'es': 'dentro de 15 minutos',
      'fr': 'dans les 15 minutes',
      'it': 'entro 15 minuti',
    },
    'cuwax9rl': {
      'en': 'Regular',
      'de': 'Regulär',
      'es': 'Regular',
      'fr': 'Régulier',
      'it': 'Regolare',
    },
    'q7g3vbng': {
      'en': 'On the next day',
      'de': 'Am nächsten Tag',
      'es': 'Al día siguiente',
      'fr': 'Le jour suivant',
      'it': 'Il giorno dopo',
    },
    'crajsbll': {
      'en': 'Account',
      'de': 'Konto',
      'es': 'Cuenta',
      'fr': 'Compte',
      'it': 'Account',
    },
    'qnkd1h04': {
      'en': '****4182',
      'de': '****4182',
      'es': '****4182',
      'fr': '****4182',
      'it': '****4182',
    },
    'dlzlhwnk': {
      'en': 'Name',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'it': 'Nome',
    },
    '6p2wkzo0': {
      'en': 'Baraka Obama',
      'de': 'Baraka Obama',
      'es': 'Baraka Obama',
      'fr': 'Baraka Obama',
      'it': 'Baraka Obama',
    },
    'uh55zoo6': {
      'en': 'Loan amount',
      'de': 'Kreditbetrag',
      'es': 'Monto del préstamo',
      'fr': 'Montant du prêt',
      'it': 'Ammontare del prestito',
    },
    'oiyiwldd': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '2980z8y1': {
      'en': 'Commission',
      'de': 'Kommission',
      'es': 'Comisión',
      'fr': 'Commission',
      'it': 'Commissione',
    },
    'lzt7rcd9': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'e4imeoat': {
      'en': 'You pay',
      'de': 'Sie bezahlen',
      'es': 'Tu pagas',
      'fr': 'Tu payes',
      'it': 'Tu paghi',
    },
    'kqmaan9h': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '8s7q60cl': {
      'en': 'Make a payment',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '6oay9nu0': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // borrowError
  {
    'eyxjngkz': {
      'en': 'Oops! Something went wrong.',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    'fu39vl6k': {
      'en':
          'We encountered an error. Please give it another try, and thank you for your patience!',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    'omw8qle3': {
      'en': 'Try again',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'lsbg4ajt': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // borrowSuccess
  {
    'amagi1ie': {
      'en': 'Money\'s on its way',
      'de': 'Das Geld ist unterwegs',
      'es': 'El dinero está en camino',
      'fr': 'L\'argent est en route',
      'it': 'Il denaro sta arrivando',
    },
    'm5u5plar': {
      'en': 'The money will be soon sent to your account ',
      'de': 'Das Geld ist innerhalb von 15 Minuten auf Ihrem Konto',
      'es': 'El dinero estará en tu cuenta en 15 minutos.',
      'fr': 'L\'argent sera sur votre compte dans les 15 minutes',
      'it': 'Il denaro sarà sul tuo conto entro 15 minuti',
    },
    'f8i639t6': {
      'en': 'Take me home',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'krovc5yq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // apporvedForScreen
  {
    '1qmey1uc': {
      'en': 'Approved up to €250',
      'de': 'Zugelassen bis 250 €',
      'es': 'Homologado hasta 250€',
      'fr': 'Agréé jusqu\'à 250 €',
      'it': 'Omologato fino a 250€',
    },
    'v0adcala': {
      'en': 'Select your Cash Advance below. You can only draw up to 250€',
      'de':
          'Wählen Sie unten Ihren Barvorschuss aus. Sie können bis zu Ihrem nächsten Vorstoß nur einmal ziehen. Nehmen Sie sich also unbedingt das mit, was Sie brauchen',
      'es':
          'Seleccione su adelanto en efectivo a continuación. Solo puedes dibujar una vez hasta tu próximo avance, así que asegúrate de llevar lo que necesitas.',
      'fr':
          'Sélectionnez votre avance de fonds ci-dessous. Vous ne pouvez tirer qu\'une seule fois jusqu\'à votre prochaine avance, alors assurez-vous de prendre ce dont vous avez besoin.',
      'it':
          'Seleziona il tuo anticipo in contanti qui sotto. Puoi pescare solo una volta fino al tuo prossimo Avanzamento, quindi assicurati di prendere ciò di cui hai bisogno',
    },
    'x37qr8iw': {
      'en': '€250',
      'de': '250 €',
      'es': '250€',
      'fr': '250 €',
      'it': '€250',
    },
    'gdwn5cmk': {
      'en': '€200',
      'de': '200 €',
      'es': '200€',
      'fr': '200 €',
      'it': '€200',
    },
    'bdyie8y2': {
      'en': '€150',
      'de': '150 €',
      'es': '150€',
      'fr': '150 €',
      'it': '€150',
    },
    'e2h43d65': {
      'en': '€100',
      'de': '100 €',
      'es': '100€',
      'fr': '100 €',
      'it': '€ 100',
    },
    'o83yx5i9': {
      'en': 'Maybe later',
      'de': 'Vielleicht später',
      'es': 'Quizas mas tarde',
      'fr': 'Peut-être plus tard',
      'it': 'Forse più tardi',
    },
    'dqjfx5h7': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // needSomeCashWidgetOpen
  {
    'wuqdkfvg': {
      'en': 'Your balance is running low, need some cash?',
      'de': 'Ihr Guthaben geht zur Neige, Sie brauchen etwas Bargeld?',
      'es': 'Tu saldo se está agotando, ¿necesitas algo de efectivo?',
      'fr': 'Votre solde est faible, vous avez besoin d’argent ?',
      'it': 'Il tuo saldo sta per esaurirsi, hai bisogno di contanti?',
    },
    'w0donbwo': {
      'en': '€250 is available to borrow',
      'de': 'Es stehen 250 € zum Ausleihen zur Verfügung',
      'es': '250 € están disponibles para pedir prestado',
      'fr': '250 € sont disponibles à l\'emprunt',
      'it': 'È possibile prendere in prestito 250 euro',
    },
    'm7jm9ht1': {
      'en': 'Borrow',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '425e5v8i': {
      'en': 'Maybe later',
      'de': 'Vielleicht später',
      'es': 'Quizas mas tarde',
      'fr': 'Peut-être plus tard',
      'it': 'Forse più tardi',
    },
    '5x0cgxni': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // step1Banner
  {
    '5sz904fv': {
      'en': 'Welcome to EuroGet: complete your profile',
      'de': 'Willkommen bei EuroGet: Vervollständigen Sie Ihr Profil',
      'es': 'Bienvenido a EuroGet: completa tu perfil',
      'fr': 'Bienvenue sur EuroGet : complétez votre profil',
      'it': 'Benvenuto su EuroGet: completa il tuo profilo',
    },
    'nlxq3kif': {
      'en': 'Each section should only take a couple  of minutes to complete',
      'de':
          'Die Fertigstellung jedes Abschnitts sollte nur ein paar Minuten dauern',
      'es':
          'Cada sección solo debería tomar un par de minutos para completarse.',
      'fr':
          'Chaque section ne devrait prendre que quelques minutes à compléter',
      'it':
          'Il completamento di ciascuna sezione dovrebbe richiedere solo un paio di minuti',
    },
    '3y0pobe2': {
      'en': 'Your identify',
      'de': 'Ihr Name',
      'es': 'tu identidad',
      'fr': 'Votre identité',
      'it': 'La tua identità',
    },
    '9kmqy7xi': {
      'en': 'Checking to make sure you and your ID match',
      'de': 'Wir prüfen, ob Sie und Ihr Ausweis übereinstimmen',
      'es': 'Verificar que usted y su identificación coincidan',
      'fr': 'Vérifier que vous et votre pièce d\'identité correspondent',
      'it': 'Stiamo controllando che tu e il tuo ID corrispondiate',
    },
    '9dzlw8u9': {
      'en': '2',
      'de': '2',
      'es': '2',
      'fr': '2',
      'it': '2',
    },
    'wcozbk2f': {
      'en': 'Personal information',
      'de': 'Persönliche Angaben',
      'es': 'Informacion personal',
      'fr': 'Informations personnelles',
      'it': 'Informazione personale',
    },
    '7261rolc': {
      'en': 'Details to ensure authenticity',
      'de': 'Details zur Gewährleistung der Authentizität',
      'es': 'Detalles para garantizar la autenticidad',
      'fr': 'Détails pour garantir l\'authenticité',
      'it': 'Dettagli per garantire l\'autenticità',
    },
    'lakvoan7': {
      'en': '3',
      'de': '3',
      'es': '3',
      'fr': '3',
      'it': '3',
    },
    'x39uauhn': {
      'en': 'Bank account connect',
      'de': 'Ihr Konto',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
      'it': 'Il tuo account',
    },
    '58k1n4st': {
      'en':
          'Connect your bank account, so we \ncan determine your credit limit',
      'de':
          'Richten Sie Ihre finanziellen Verbindungen ein und bestätigen Sie sie',
      'es': 'Configure y confirme sus conexiones financieras',
      'fr': 'Établissez et confirmez vos connexions financières',
      'it': 'Configura e conferma le tue connessioni finanziarie',
    },
    'qqt55uxe': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    '374214rh': {
      'en': 'Your credit score is unaffected, and your info remains secure',
      'de':
          'Ihre Kreditwürdigkeit bleibt davon unberührt und Ihre Daten bleiben sicher',
      'es':
          'Su puntaje crediticio no se ve afectado y su información permanece segura',
      'fr':
          'Votre pointage de crédit n\'est pas affecté et vos informations restent sécurisées',
      'it':
          'Il tuo punteggio di credito non viene influenzato e le tue informazioni rimangono al sicuro',
    },
    '4itb8x0g': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // step2Banner
  {
    'p3xpsmhe': {
      'en': 'Welcome to EuroGet: complete your profile',
      'de': 'Willkommen bei EuroGet: Vervollständigen Sie Ihr Profil',
      'es': 'Bienvenido a EuroGet: completa tu perfil',
      'fr': 'Bienvenue sur EuroGet : complétez votre profil',
      'it': 'Benvenuto su EuroGet: completa il tuo profilo',
    },
    'o6sviu34': {
      'en': 'Each section should only take a couple  of minutes to complete',
      'de':
          'Die Fertigstellung jedes Abschnitts sollte nur ein paar Minuten dauern',
      'es':
          'Cada sección solo debería tomar un par de minutos para completarse.',
      'fr':
          'Chaque section ne devrait prendre que quelques minutes à compléter',
      'it':
          'Il completamento di ciascuna sezione dovrebbe richiedere solo un paio di minuti',
    },
    '4myq3ljf': {
      'en': 'Your identify',
      'de': 'Ihr Name',
      'es': 'tu identidad',
      'fr': 'Votre identité',
      'it': 'La tua identità',
    },
    '1daem55q': {
      'en': 'Checking to make sure you and your ID match',
      'de': 'Wir prüfen, ob Sie und Ihr Ausweis übereinstimmen',
      'es': 'Verificar que usted y su identificación coincidan',
      'fr': 'Vérifier que vous et votre pièce d\'identité correspondent',
      'it': 'Stiamo controllando che tu e il tuo ID corrispondiate',
    },
    'rr8j4j9b': {
      'en': 'Personal information',
      'de': 'Persönliche Angaben',
      'es': 'Informacion personal',
      'fr': 'Informations personnelles',
      'it': 'Informazione personale',
    },
    '0pkoe771': {
      'en': 'Details to ensure authenticity',
      'de': 'Details zur Gewährleistung der Authentizität',
      'es': 'Detalles para garantizar la autenticidad',
      'fr': 'Détails pour garantir l\'authenticité',
      'it': 'Dettagli per garantire l\'autenticità',
    },
    'ewoz4u6o': {
      'en': '3',
      'de': '3',
      'es': '3',
      'fr': '3',
      'it': '3',
    },
    'sljwbb90': {
      'en': 'Bank account connect',
      'de': 'Ihr Konto',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
      'it': 'Il tuo account',
    },
    'rfwire54': {
      'en':
          'Connect your bank account, so we \ncan determine your credit limit',
      'de':
          'Richten Sie Ihre finanziellen Verbindungen ein und bestätigen Sie sie',
      'es': 'Configure y confirme sus conexiones financieras',
      'fr': 'Établissez et confirmez vos connexions financières',
      'it': 'Configura e conferma le tue connessioni finanziarie',
    },
    '78jc8tmh': {
      'en': 'Set up a bank account',
      'de': 'Richten Sie ein Bankkonto ein',
      'es': 'Configurar una cuenta bancaria',
      'fr': 'Créer un compte bancaire',
      'it': 'Apri un conto bancario',
    },
    '0syey5be': {
      'en': 'Your credit score is unaffected, and your info remains secure',
      'de':
          'Ihre Kreditwürdigkeit bleibt davon unberührt und Ihre Daten bleiben sicher',
      'es':
          'Su puntaje crediticio no se ve afectado y su información permanece segura',
      'fr':
          'Votre pointage de crédit n\'est pas affecté et vos informations restent sécurisées',
      'it':
          'Il tuo punteggio di credito non viene influenzato e le tue informazioni rimangono al sicuro',
    },
    'u2p88nvq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // step3Banner
  {
    '601uij03': {
      'en': 'Welcome to EuroGet: complete your profile',
      'de': 'Willkommen bei EuroGet: Vervollständigen Sie Ihr Profil',
      'es': 'Bienvenido a EuroGet: completa tu perfil',
      'fr': 'Bienvenue sur EuroGet : complétez votre profil',
      'it': 'Benvenuto su EuroGet: completa il tuo profilo',
    },
    'stjlggc0': {
      'en': 'Each section should only take a couple  of minutes to complete',
      'de':
          'Die Fertigstellung jedes Abschnitts sollte nur ein paar Minuten dauern',
      'es':
          'Cada sección solo debería tomar un par de minutos para completarse.',
      'fr':
          'Chaque section ne devrait prendre que quelques minutes à compléter',
      'it':
          'Il completamento di ciascuna sezione dovrebbe richiedere solo un paio di minuti',
    },
    '0umfwmo8': {
      'en': 'Your identify',
      'de': 'Ihr Name',
      'es': 'tu identidad',
      'fr': 'Votre identité',
      'it': 'La tua identità',
    },
    'vzbjfq94': {
      'en': 'Checking to make sure you and your ID match',
      'de': 'Wir prüfen, ob Sie und Ihr Ausweis übereinstimmen',
      'es': 'Verificar que usted y su identificación coincidan',
      'fr': 'Vérifier que vous et votre pièce d\'identité correspondent',
      'it': 'Stiamo controllando che tu e il tuo ID corrispondiate',
    },
    'zajr2a5x': {
      'en': 'Personal information',
      'de': 'Persönliche Angaben',
      'es': 'Informacion personal',
      'fr': 'Informations personnelles',
      'it': 'Informazione personale',
    },
    '9mk5elzh': {
      'en': 'Details to ensure authenticity',
      'de': 'Details zur Gewährleistung der Authentizität',
      'es': 'Detalles para garantizar la autenticidad',
      'fr': 'Détails pour garantir l\'authenticité',
      'it': 'Dettagli per garantire l\'autenticità',
    },
    'fzjbgnqz': {
      'en': 'Bank account connect',
      'de': 'Ihr Konto',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
      'it': 'Il tuo account',
    },
    'lgnwdbxu': {
      'en':
          'Connect your bank account, so we \ncan determine your credit limit',
      'de':
          'Richten Sie Ihre finanziellen Verbindungen ein und bestätigen Sie sie',
      'es': 'Configure y confirme sus conexiones financieras',
      'fr': 'Établissez et confirmez vos connexions financières',
      'it': 'Configura e conferma le tue connessioni finanziarie',
    },
    'dqo5ne1d': {
      'en': 'Finish',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '5q65due5': {
      'en': 'Your credit score is unaffected, and your info remains secure',
      'de':
          'Ihre Kreditwürdigkeit bleibt davon unberührt und Ihre Daten bleiben sicher',
      'es':
          'Su puntaje crediticio no se ve afectado y su información permanece segura',
      'fr':
          'Votre pointage de crédit n\'est pas affecté et vos informations restent sécurisées',
      'it':
          'Il tuo punteggio di credito non viene influenzato e le tue informazioni rimangono al sicuro',
    },
    '0vmlzx13': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // countrySelect
  {
    'bq3dlhof': {
      'en': 'Select your bank\'s country',
      'de': 'Wähle dein Land',
      'es': 'Selecciona tu pais',
      'fr': 'Sélectionnez votre pays',
      'it': 'Seleziona il tuo paese',
    },
    'bi94h907': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // bankSelect
  {
    '6u44plwn': {
      'en': 'Select your bank',
      'de': 'Wählen Sie Ihre Bank aus',
      'es': 'Selecciona tu banco',
      'fr': 'Sélectionnez votre banque',
      'it': 'Seleziona la tua banca',
    },
    '5vuhbnnj': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // bankaccountConnect
  {
    'xxf1m1fs': {
      'en': 'Please  finish connecting the bank account',
      'de': 'Willkommen bei EuroGet: Vervollständigen Sie Ihr Profil',
      'es': 'Bienvenido a EuroGet: completa tu perfil',
      'fr': 'Bienvenue sur EuroGet : complétez votre profil',
      'it': 'Benvenuto su EuroGet: completa il tuo profilo',
    },
    '5sb34cq9': {
      'en':
          'In order to get a cash advance you need to connect at least one bank account',
      'de':
          'Die Fertigstellung jedes Abschnitts sollte nur ein paar Minuten dauern',
      'es':
          'Cada sección solo debería tomar un par de minutos para completarse.',
      'fr':
          'Chaque section ne devrait prendre que quelques minutes à compléter',
      'it':
          'Il completamento di ciascuna sezione dovrebbe richiedere solo un paio di minuti',
    },
    'ke9vu5vi': {
      'en': 'Next',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    'ylkwv4q5': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // accountSupportThanks
  {
    'pqpxmaxm': {
      'en': 'Your ticket has been submitted!',
      'de': 'Ihr Ticket wurde eingereicht!',
      'es': '¡Su boleto ha sido enviado!',
      'fr': 'Votre billet a été soumis !',
      'it': 'Il tuo biglietto è stato inviato!',
    },
    'ais3xnu9': {
      'en': 'We will get back to you within 3 business days',
      'de': 'Wir werden uns innerhalb von 48 Stunden bei Ihnen melden',
      'es': 'Nos comunicaremos con usted dentro de las 48 horas',
      'fr': 'Nous vous répondrons dans les 48 heures',
      'it': 'Ti risponderemo entro 48 ore',
    },
    'ezwgndbj': {
      'en': 'Okay',
      'de': 'Okay',
      'es': 'Bueno',
      'fr': 'D\'accord',
      'it': 'Va bene',
    },
    '3vlvh9hg': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // payScreenDefault
  {
    'umm3svco': {
      'en': 'Unpaid debt',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    'e3kbzufj': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    '8qyw6gcg': {
      'en': 'Next payment',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'tlh3yp91': {
      'en': 'Amount',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'v0vqrgs9': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'fo615hys': {
      'en': 'Upcoming payments',
      'de': 'Anstehende Zahlungen',
      'es': 'Próximos pagos',
      'fr': 'Paiements à venir',
      'it': 'Prossimi pagamenti',
    },
    'gmy4pxz7': {
      'en': 'History',
      'de': 'Alle Bestellungen',
      'es': 'Todas las órdenes',
      'fr': 'Tous les ordres',
      'it': 'Tutti gli ordini',
    },
    'w4eziuja': {
      'en': 'Payment ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'p3o167aq': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'oo6fbg7r': {
      'en': 'Remaining',
      'de': 'Übrig',
      'es': 'Restante',
      'fr': 'Restant',
      'it': 'Residuo',
    },
    '11g6k232': {
      'en': 'You don’t have any upcoming payments',
      'de': 'Sie haben noch keine Zahlungen',
      'es': 'Aún no tienes ningún pago',
      'fr': 'Vous n\'avez pas encore de paiement',
      'it': 'Non hai ancora alcun pagamento',
    },
    'ru5j0ne0': {
      'en': 'Upcoming payments',
      'de': 'Anstehende Zahlungen',
      'es': 'Próximos pagos',
      'fr': 'Paiements à venir',
      'it': 'Prossimi pagamenti',
    },
    '0944cmn0': {
      'en': 'History',
      'de': 'Alle Bestellungen',
      'es': 'Todas las órdenes',
      'fr': 'Tous les ordres',
      'it': 'Tutti gli ordini',
    },
    '03fr7uim': {
      'en': 'Payment ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'zfy5n4p2': {
      'en': 'Paid',
      'de': 'Montag, 15. Oktober',
      'es': 'lunes 15 de octubre',
      'fr': 'lundi 15 octobre',
      'it': 'Lunedì 15 ottobre',
    },
    'rjtblzb0': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'utfhxj87': {
      'en': 'Paid',
      'de': 'Übrig',
      'es': 'Restante',
      'fr': 'Restant',
      'it': 'Residuo',
    },
    '4sx1eavv': {
      'en': 'You don’t have any hsitorical payments payments',
      'de': 'Sie haben noch keine Zahlungen',
      'es': 'Aún no tienes ningún pago',
      'fr': 'Vous n\'avez pas encore de paiement',
      'it': 'Non hai ancora alcun pagamento',
    },
    's52pfks5': {
      'en': 'Pay all',
      'de': 'Behalten Sie Premium',
      'es': 'Mantener prima',
      'fr': 'Conserver la prime',
      'it': 'Mantieni Premium',
    },
    'cphpbt46': {
      'en': 'Pay all',
      'de': 'Behalten Sie Premium',
      'es': 'Mantener prima',
      'fr': 'Conserver la prime',
      'it': 'Mantieni Premium',
    },
    'wqx6o2np': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // waitingScreen
  {
    'e9aaw48r': {
      'en': 'You\'re approved! \nWe\'ll notify a launch',
      'de': 'Du bist zugelassen!\nWir werden einen Start benachrichtigen',
      'es': '¡Estás aprobado!\nNotificaremos un lanzamiento.',
      'fr': 'Vous êtes approuvé !\nNous vous informerons d\'un lancement',
      'it': 'Sei approvato!\nNotificheremo il lancio',
    },
    '7woeyzfs': {
      'en': 'Schedule your payments and pay  in 4 installments',
      'de': 'Planen Sie Ihre Zahlungen und zahlen Sie in 4 Raten',
      'es': 'Programe sus pagos y pague en 4 cuotas',
      'fr': 'Planifiez vos paiements et payez en 4 fois',
      'it': 'Pianifica i tuoi pagamenti e paga in 4 rate',
    },
    'tgc58djz': {
      'en': 'You\'re approved! \nWe\'ll notify a launch',
      'de': 'Du bist zugelassen!\nWir werden einen Start benachrichtigen',
      'es': '¡Estás aprobado!\nNotificaremos un lanzamiento.',
      'fr': 'Vous êtes approuvé !\nNous vous informerons d\'un lancement',
      'it': 'Sei approvato!\nNotificheremo il lancio',
    },
    'po5l5wwb': {
      'en': 'Schedule your payments and pay  in 4 installments',
      'de': 'Planen Sie Ihre Zahlungen und zahlen Sie in 4 Raten',
      'es': 'Programe sus pagos y pague en 4 cuotas',
      'fr': 'Planifiez vos paiements et payez en 4 fois',
      'it': 'Pianifica i tuoi pagamenti e paga in 4 rate',
    },
    '4jqodm6a': {
      'en': 'You\'re approved! \nWe\'ll notify a launch',
      'de': 'Du bist zugelassen!\nWir werden einen Start benachrichtigen',
      'es': '¡Estás aprobado!\nNotificaremos un lanzamiento.',
      'fr': 'Vous êtes approuvé !\nNous vous informerons d\'un lancement',
      'it': 'Sei approvato!\nNotificheremo il lancio',
    },
    'lwnnbiah': {
      'en': 'Schedule your payments and pay  in 4 installments',
      'de': 'Planen Sie Ihre Zahlungen und zahlen Sie in 4 Raten',
      'es': 'Programe sus pagos y pague en 4 cuotas',
      'fr': 'Planifiez vos paiements et payez en 4 fois',
      'it': 'Pianifica i tuoi pagamenti e paga in 4 rate',
    },
    'az0dd23p': {
      'en': 'Close App',
      'de': 'App schließen',
      'es': 'Cerrar app',
      'fr': 'Fermer l\'application',
      'it': 'Chiudi l\'app',
    },
    'hrol0ozu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // signupCopy
  {
    '2a9ud3zr': {
      'en': 'Welcome to EuroGet',
      'de': 'Willkommen bei EuroGet',
      'es': 'Bienvenido a EuroGet',
      'fr': 'Bienvenue sur EuroGet',
      'it': 'Benvenuti in EuroGet',
    },
    '20nlickw': {
      'en': 'Tell us the email address and we\'ll  send you a login link',
      'de':
          'Teilen Sie uns Ihre E-Mail-Adresse mit und wir senden Ihnen einen Login-Link',
      'es':
          'Díganos la dirección de correo electrónico y le enviaremos un enlace de inicio de sesión',
      'fr':
          'Donnez-nous l\'adresse e-mail et nous vous enverrons un lien de connexion',
      'it': 'Comunicaci l\'indirizzo email e ti invieremo un link di accesso',
    },
    'pema76ay': {
      'en': 'Mail',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Mail',
      'it': 'Posta',
    },
    'fnuoi3np': {
      'en': 'youremail@gmail.com',
      'de': 'youremail@gmail.com',
      'es': 'tucorreo electrónico@gmail.com',
      'fr': 'votre email@gmail.com',
      'it': 'tuaemail@gmail.com',
    },
    '2em46c3p': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    '4evgl1et': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'xeo8jiis': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    'e5sr5dv2': {
      'en': 'or',
      'de': 'oder',
      'es': 'o',
      'fr': 'ou',
      'it': 'O',
    },
    'a6dlb0ex': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
      'it': 'Continua con Apple',
    },
    '6ed9k11z': {
      'en': 'Already have an account? Log in',
      'de': 'Sie haben bereits ein Konto? Anmeldung',
      'es': '¿Ya tienes una cuenta? Acceso',
      'fr': 'Vous avez déjà un compte? Se connecter',
      'it': 'Hai già un account? Login',
    },
    '16dsktc7': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // borrowReachedLimit
  {
    'xew4vjmz': {
      'en': 'Reached limit',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    'x47ew5kt': {
      'en':
          'For now we allow 2 simultenious loans, please pay back the existing ones to borrow more',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    'fw9zd469': {
      'en': 'Try again',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    '9vopo6ep': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // paymentCreated
  {
    '6x2z5n35': {
      'en': 'Payment created',
      'de': 'Sie haben keine Zahlungen',
      'es': 'No tienes ningún pago',
      'fr': 'Vous n\'avez aucun paiement',
      'it': 'Non hai alcun pagamento',
    },
    'aztz7fhr': {
      'en': 'Please confirm the payment from your banking app',
      'de': 'Zahlungen werden angezeigt, wenn Sie einen Kredit aufnehmen',
      'es': 'Los pagos aparecerán si solicita un préstamo',
      'fr': 'Les paiements apparaîtront si vous contractez un prêt',
      'it': 'I pagamenti verranno visualizzati se si richiede un prestito',
    },
    'vezzgumh': {
      'en': 'Close',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'lv4kyg28': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // membershipBannerResubscribe
  {
    'k8pnxwtu': {
      'en': 'Unlock 500€  for just 9.99€!',
      'de': 'Schalten Sie 500 € für nur 9,99 € frei!',
      'es': '¡Desbloquea 500€ por sólo 9,99€!',
      'fr': 'Débloquez 500€ pour seulement 9,99€ !',
      'it': 'Sblocca 500€ a soli 9,99€!',
    },
    '5ebcanx4': {
      'en':
          'Prices may rise for re-subscribers. Lock in your current price and keep access?',
      'de':
          'Für Wiederabonnenten können sich die Preise erhöhen. Aktuellen Preis festlegen und Zugriff behalten?',
      'es':
          'Los precios pueden aumentar para los nuevos suscriptores. ¿Fijar su precio actual y mantener el acceso?',
      'fr':
          'Les prix peuvent augmenter pour les réabonnés. Verrouiller votre prix actuel et conserver l\'accès ?',
      'it':
          'I prezzi potrebbero aumentare per i nuovi abbonati. Bloccare il prezzo attuale e mantenere l\'accesso?',
    },
    '2bp24mng': {
      'en': 'No credit checks',
      'de': 'Keine Bonitätsprüfung',
      'es': 'Sin verificaciones de crédito',
      'fr': 'Aucune vérification de crédit',
      'it': 'Nessun controllo del credito',
    },
    'c3ewd7k8': {
      'en': 'No interest ',
      'de': 'Kein Interesse',
      'es': 'No hay interés',
      'fr': 'Pas d\'intérêt',
      'it': 'Nessun interesse',
    },
    'hl94gntn': {
      'en': '1 month free trial',
      'de': '1 Monat kostenlose Testversion',
      'es': '1 mes de prueba gratis',
      'fr': '1 mois d\'essai gratuit',
      'it': '1 mese di prova gratuita',
    },
    'hs9myo45': {
      'en': 'Borrow up to 500€',
      'de': 'Leihen Sie bis zu 500€',
      'es': 'Préstamo hasta 500€',
      'fr': 'Emprunter jusqu\'à 500€',
      'it': 'Prendi in prestito fino a 500€',
    },
    '4hfacd2o': {
      'en': 'AI overdraft protection',
      'de': 'Überziehungsschutz',
      'es': 'Proteccion DE sobregiro',
      'fr': 'Protection contre les découverts',
      'it': 'Protezione dallo scoperto',
    },
    'b3uzvf0g': {
      'en': '24/5 support',
      'de': 'Support rund um die Uhr',
      'es': 'Soporte 24 horas al día, 7 días a la semana',
      'fr': 'Assistance 24h/24 et 7j/7',
      'it': 'Supporto 24 ore su 24, 7 giorni su 7',
    },
    'f7fw0v6o': {
      'en': 'Get started',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'rwoypxi3': {
      'en': 'Auto-renewable. Cancel anytime.',
      'de': 'Automatisch erneuerbar. Jederzeit kündbar.',
      'es': 'Renovable automáticamente. Cancele en cualquier momento.',
      'fr': 'Auto-renouvelable. Annulez à tout moment.',
      'it': 'Rinnovabile automaticamente. Annulla in qualsiasi momento.',
    },
    '9zqwrfvc': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // membershipOptionsResubscribe
  {
    'y94r1x55': {
      'en': 'Choose your plan',
      'de': 'Wählen Sie Ihren Plan',
      'es': 'Elige tu plan',
      'fr': 'Choisissez votre forfait',
      'it': 'Scegli il tuo piano',
    },
    '6o3k3dgl': {
      'en': 'Choose the option that works best for you',
      'de':
          'Für Wiederabonnenten können sich die Preise erhöhen. Aktuellen Preis festlegen und Zugriff behalten?',
      'es':
          'Los precios pueden aumentar para los nuevos suscriptores. ¿Fijar su precio actual y mantener el acceso?',
      'fr':
          'Les prix peuvent augmenter pour les réabonnés. Verrouiller votre prix actuel et conserver l\'accès ?',
      'it':
          'I prezzi potrebbero aumentare per i nuovi abbonati. Bloccare il prezzo attuale e mantenere l\'accesso?',
    },
    '8dtmyxai': {
      'en': 'Monthly',
      'de': 'Monatlich',
      'es': 'Mensual',
      'fr': 'Mensuel',
      'it': 'Mensile',
    },
    'tk94f70x': {
      'en': '€8.99/mo',
      'de': '9,99 €/Monat',
      'es': '9,99€/mes',
      'fr': '9,99 €/mois',
      'it': '€ 9,99/mese',
    },
    '05jfcrlq': {
      'en': 'Annual',
      'de': 'Jährlich',
      'es': 'Anual',
      'fr': 'Annuel',
      'it': 'Annuale',
    },
    'jathy1sj': {
      'en': '€84.99/yr',
      'de': '109,99 €/Jahr',
      'es': '109,99 €/año',
      'fr': '109,99 €/an',
      'it': '€ 109,99/anno',
    },
    'hl9bte2p': {
      'en': 'Save 20%',
      'de': 'Sparen Sie 20 %',
      'es': 'Ahorra 20%',
      'fr': 'Économisez 20 %',
      'it': 'Risparmia il 20%',
    },
    'gfdioq0r': {
      'en': 'IBAN',
      'de': 'Bezahlverfahren',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
      'it': 'Metodo di pagamento',
    },
    'mr4impev': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'qj1yd5ym': {
      'en': 'Auto-renewable. Cancel anytime.',
      'de': 'Automatisch erneuerbar. Jederzeit kündbar.',
      'es': 'Renovable automáticamente. Cancele en cualquier momento.',
      'fr': 'Auto-renouvelable. Annulez à tout moment.',
      'it': 'Rinnovabile automaticamente. Annulla in qualsiasi momento.',
    },
    'fzjmpnio': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // advanceVerification
  {
    'tqd391yg': {
      'en': 'Advance Verification',
      'de': 'Kontaktdetails',
      'es': 'Detalles de contacto',
      'fr': 'Détails du contact',
      'it': 'Dettagli del contatto',
    },
    'dwcb1f6e': {
      'en': 'Advance ID',
      'de': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'go07c6oo': {
      'en': 'Installment ID',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Mail',
      'it': 'Posta',
    },
    'm5cz6jqj': {
      'en': 'Issued at',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
      'it': 'Paese',
    },
    '4ce861g5': {
      'en': 'Profile',
      'de': 'Profil',
      'es': 'Perfil',
      'fr': 'Profil',
      'it': 'Profilo',
    },
  },
  // borrowOptions
  {
    '3eo1nwav': {
      'en': 'Choose your plan',
      'de': 'Wählen Sie Ihren Plan',
      'es': 'Elige tu plan',
      'fr': 'Choisissez votre forfait',
      'it': 'Scegli il tuo piano',
    },
    '0gosirxf': {
      'en': 'Choose the option that works best for you',
      'de':
          'Für Wiederabonnenten können sich die Preise erhöhen. Aktuellen Preis festlegen und Zugriff behalten?',
      'es':
          'Los precios pueden aumentar para los nuevos suscriptores. ¿Fijar su precio actual y mantener el acceso?',
      'fr':
          'Les prix peuvent augmenter pour les réabonnés. Verrouiller votre prix actuel et conserver l\'accès ?',
      'it':
          'I prezzi potrebbero aumentare per i nuovi abbonati. Bloccare il prezzo attuale e mantenere l\'accesso?',
    },
    '0hkvg4i0': {
      'en': 'Pay in 4',
      'de': 'Monatlich',
      'es': 'Mensual',
      'fr': 'Mensuel',
      'it': 'Mensile',
    },
    'c2q75ao8': {
      'en': 'Four-part payment plan',
      'de': '9,99 €/Monat',
      'es': '9,99€/mes',
      'fr': '9,99 €/mois',
      'it': '€ 9,99/mese',
    },
    'bg8chm6u': {
      'en': 'On payday',
      'de': 'Jährlich',
      'es': 'Anual',
      'fr': 'Annuel',
      'it': 'Annuale',
    },
    't63y277m': {
      'en': 'Pay after salary day',
      'de': '109,99 €/Jahr',
      'es': '109,99 €/año',
      'fr': '109,99 €/an',
      'it': '€ 109,99/anno',
    },
    'gwhowdou': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'c05uob65': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // borrowSelectPayday
  {
    'wzxsdv32': {
      'en': 'Choose next payday',
      'de': 'Zahlungsrechner',
      'es': 'Calculadora de pagos',
      'fr': 'Calculateur de paiement',
      'it': 'Calcolatore dei pagamenti',
    },
    '4niun0c7': {
      'en':
          'Select a date to align your payment with your income day for easy financial management',
      'de':
          'Nutzen Sie den Schieberegler, um Ihren Zahlungsplan für Ihren nächsten Einkauf mit Pay in 4 abzuschätzen',
      'es':
          'Utilice el control deslizante para estimar su plan de pago para su próxima compra con Pago en 4',
      'fr':
          'Utilisez le curseur pour estimer votre plan de paiement pour votre prochain achat avec Pay in 4',
      'it':
          'Utilizza lo slider per stimare il tuo piano di pagamento per il tuo prossimo acquisto con Pay in 4',
    },
    '4hjwqile': {
      'en': '€',
      'de': '€',
      'es': '€',
      'fr': '€',
      'it': '€',
    },
    'njt7y4rx': {
      'en': 'Hello World',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    'zj4sr9jm': {
      'en': 'DD.MM.YYYY',
      'de': 'youremail@gmail.com',
      'es': 'tucorreo electrónico@gmail.com',
      'fr': 'votre email@gmail.com',
      'it': 'tuaemail@gmail.com',
    },
    'rxv34a8j': {
      'en': 'The day of the next paycheck',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    'l24mrg9u': {
      'en': 'Remember my choise',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'e9lnft4d': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    '59jkrr73': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // Limitpage_step0
  {
    'lu4z510m': {
      'en': 'Select the boundary for replenishment',
      'de': 'Zugelassen bis 250 €',
      'es': 'Homologado hasta 250€',
      'fr': 'Agréé jusqu\'à 250 €',
      'it': 'Omologato fino a 250€',
    },
    'r1ei7eaq': {
      'en': '€1000',
      'de': '250 €',
      'es': '250€',
      'fr': '250 €',
      'it': '€250',
    },
    '5vd8ageg': {
      'en': '€500',
      'de': '200 €',
      'es': '200€',
      'fr': '200 €',
      'it': '€200',
    },
    '2z1jkqp8': {
      'en': '€250',
      'de': '150 €',
      'es': '150€',
      'fr': '150 €',
      'it': '€150',
    },
    'w5od67al': {
      'en': '€100',
      'de': '100 €',
      'es': '100€',
      'fr': '100 €',
      'it': '€ 100',
    },
    'fluzpsd5': {
      'en': 'Maybe later',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'vbxaffcz': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // Limitpage_step1
  {
    '2he3p9e5': {
      'en': 'How much do you want to receive?',
      'de': 'Zugelassen bis 250 €',
      'es': 'Homologado hasta 250€',
      'fr': 'Agréé jusqu\'à 250 €',
      'it': 'Omologato fino a 250€',
    },
    'f997piq1': {
      'en': '€500',
      'de': '250 €',
      'es': '250€',
      'fr': '250 €',
      'it': '€250',
    },
    '3fk24b1j': {
      'en': '€250',
      'de': '200 €',
      'es': '200€',
      'fr': '200 €',
      'it': '€200',
    },
    'z0d194j8': {
      'en': '€100',
      'de': '150 €',
      'es': '150€',
      'fr': '150 €',
      'it': '€150',
    },
    '0ax7d8mr': {
      'en': '€50',
      'de': '100 €',
      'es': '100€',
      'fr': '100 €',
      'it': '€ 100',
    },
    'pjjt2ptw': {
      'en': 'Maybe later',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '5fbs5j7f': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // NPSQuestionaire
  {
    'wp0eiiab': {
      'en': 'How would you  rate this process?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'k2521pe3': {
      'en': 'We really value your opinion',
      'de': 'Schreiben Sie über das Problem',
      'es': 'Escribir sobre el problema',
      'fr': 'Écrire sur le problème',
      'it': 'Scrivi sul problema',
    },
    'y2xy6hba': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    's7nkf0eb': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // cantServeYouATM
  {
    'm6qs9cwv': {
      'en': 'We cannot serve  you at this moment',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    'ti4kryda': {
      'en': 'Please try again in 24 hours',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    'ukcj5t1g': {
      'en': 'Go Home',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'ib1n9qi3': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // limitError
  {
    'kut7lyt6': {
      'en': 'Oops! Something went wrong.',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    'bwunh728': {
      'en':
          'We encountered an error. Please give it another try, and thank you for your patience!',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    'by7f2f4b': {
      'en': 'Try again',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'ldf2b94e': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // Limitpage_update_step0
  {
    'bpoup6iu': {
      'en': 'Select the boundary for replenishment',
      'de': 'Zugelassen bis 250 €',
      'es': 'Homologado hasta 250€',
      'fr': 'Agréé jusqu\'à 250 €',
      'it': 'Omologato fino a 250€',
    },
    'c4obscqh': {
      'en': '€1000',
      'de': '250 €',
      'es': '250€',
      'fr': '250 €',
      'it': '€250',
    },
    '67zw591o': {
      'en': '€500',
      'de': '200 €',
      'es': '200€',
      'fr': '200 €',
      'it': '€200',
    },
    'y9pqpzi3': {
      'en': '€250',
      'de': '150 €',
      'es': '150€',
      'fr': '150 €',
      'it': '€150',
    },
    'x59pur3e': {
      'en': '€100',
      'de': '100 €',
      'es': '100€',
      'fr': '100 €',
      'it': '€ 100',
    },
    'imf204zc': {
      'en': 'Stop auto advance',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '79s4r8ra': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // Limitpage_update_step1
  {
    'iszx73pm': {
      'en': 'How much do you want to receive?',
      'de': 'Zugelassen bis 250 €',
      'es': 'Homologado hasta 250€',
      'fr': 'Agréé jusqu\'à 250 €',
      'it': 'Omologato fino a 250€',
    },
    '86wvzu28': {
      'en': '€500',
      'de': '250 €',
      'es': '250€',
      'fr': '250 €',
      'it': '€250',
    },
    'j43117mx': {
      'en': '€250',
      'de': '200 €',
      'es': '200€',
      'fr': '200 €',
      'it': '€200',
    },
    'hqrk7x69': {
      'en': '€100',
      'de': '150 €',
      'es': '150€',
      'fr': '150 €',
      'it': '€150',
    },
    'neicl52g': {
      'en': '€50',
      'de': '100 €',
      'es': '100€',
      'fr': '100 €',
      'it': '€ 100',
    },
    '0nhi81ed': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // autoSetUpSuccess
  {
    '2nm3zenv': {
      'en': 'Auto Cash Advance is set up',
      'de': 'Das Geld ist unterwegs',
      'es': 'El dinero está en camino',
      'fr': 'L\'argent est en route',
      'it': 'Il denaro sta arrivando',
    },
    'd9bb83j2': {
      'en':
          'The money will be automitically sent to your account if your balance hits specified treshold ',
      'de': 'Das Geld ist innerhalb von 15 Minuten auf Ihrem Konto',
      'es': 'El dinero estará en tu cuenta en 15 minutos.',
      'fr': 'L\'argent sera sur votre compte dans les 15 minutes',
      'it': 'Il denaro sarà sul tuo conto entro 15 minuti',
    },
    '40403jzx': {
      'en': 'Take me home',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'yfmjpfzh': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // chooseAnotherPaymentMethod
  {
    'zipm19ks': {
      'en': 'Choose another payment method',
      'de': 'Bezahlung für alle',
      'es': 'pago para todos',
      'fr': 'Paiement pour tous',
      'it': 'Pagamento per tutti',
    },
    'p4ohxmat': {
      'en': 'Bank transfer',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ynorz6yf': {
      'en': 'Debit or credit card',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'jdtflode': {
      'en': '(coming soon)',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '6wjrrwwm': {
      'en': 'Apple pay',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'nyrkn997': {
      'en': '(coming soon)',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'da2fe3r6': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
  // paydayPreview
  {
    'f79lvh1r': {
      'en': 'Cash Advance',
      'de': 'Netflix',
      'es': 'netflix',
      'fr': 'Netflix',
      'it': 'Netflix',
    },
    'kjpgu1hx': {
      'en': '11 September 2023',
      'de': '11. September 2023',
      'es': '11 de septiembre de 2023',
      'fr': '11 septembre 2023',
      'it': '11 settembre 2023',
    },
    'jc91bzsi': {
      'en': 'Paid',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
      'it': 'Ciao mondo',
    },
    'qb8yowb1': {
      'en': 'remaining',
      'de': 'übrig',
      'es': 'restante',
      'fr': 'restant',
      'it': 'residuo',
    },
    'uzx1ppms': {
      'en': 'Payment',
      'de': 'Erste Zahlung',
      'es': 'Primer pago',
      'fr': 'Premier paiement',
      'it': 'Prima rata',
    },
    'djmp3yan': {
      'en': '11 September 2023',
      'de': '11. September 2023',
      'es': '11 de septiembre de 2023',
      'fr': '11 septembre 2023',
      'it': '11 settembre 2023',
    },
    '8bko8dbg': {
      'en': 'Date of issuance',
      'de': 'Datum der Ausstellung',
      'es': 'Fecha de emisión',
      'fr': 'Date d\'émission',
      'it': 'Data di emissione',
    },
    'gu60tomg': {
      'en': '11 Sep 2023',
      'de': '11. September 2023',
      'es': '11 de septiembre de 2023',
      'fr': '11 septembre 2023',
      'it': '11 settembre 2023',
    },
    'hqrp8oht': {
      'en': 'Sum taken',
      'de': 'Summe genommen',
      'es': 'suma tomada',
      'fr': 'Somme prélevée',
      'it': 'Somma presa',
    },
    '42s0f79x': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'tyk25b8s': {
      'en': 'Outstanding debt',
      'de': 'Restschuld',
      'es': 'Deuda pendiente',
      'fr': 'Encours de la dette',
      'it': 'Debito in sospeso',
    },
    'ac1x0gvm': {
      'en': '€',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '4vsd9eq9': {
      'en': 'Advance ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '2y6lfzum': {
      'en': 'Advance verification',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '0sm1mybi': {
      'en': 'Pay off the installment',
      'de': 'Bezahlen',
      'es': 'Realizar un pago',
      'fr': 'Effectuer un paiement',
      'it': 'Effettua un pagamento',
    },
    '65f53hui': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // kycErrorred
  {
    'b6be1kvv': {
      'en': 'We couldn\'t process your identity',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    '3357uji9': {
      'en':
          'Please try once again, if it doesn\'t work, please contact support',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    '0zu1poz2': {
      'en': 'Try again',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'it': 'Continua',
    },
    '9qmn4qws': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // borrowContactSupport
  {
    'e66nq5lz': {
      'en': 'Oops! Something went wrong.',
      'de': 'Hoppla! Etwas ist schief gelaufen.',
      'es': '¡Ups! Algo salió mal.',
      'fr': 'Oops! Quelque chose s\'est mal passé.',
      'it': 'Ops! Qualcosa è andato storto.',
    },
    '8uzyph3a': {
      'en':
          'Please contact support we know about this error and are working on it',
      'de':
          'Wir hatten einen Schluckauf. Bitte versuchen Sie es noch einmal und vielen Dank für Ihre Geduld!',
      'es':
          'Nos encontramos con un contratiempo. ¡Inténtelo de nuevo y gracias por su paciencia!',
      'fr':
          'Nous avons rencontré un problème. Veuillez réessayer et merci pour votre patience !',
      'it':
          'Abbiamo riscontrato un singhiozzo. Per favore, fai un altro tentativo e grazie per la pazienza!',
    },
    'csbh4tii': {
      'en': 'Support',
      'de': 'Ausleihen',
      'es': 'Pedir prestado',
      'fr': 'Emprunter',
      'it': 'Prestito',
    },
    'lsrmue80': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // step0Banner
  {
    '9c2ne3d8': {
      'en': 'Welcome to EuroGet: complete your profile',
      'de': 'Willkommen bei EuroGet: Vervollständigen Sie Ihr Profil',
      'es': 'Bienvenido a EuroGet: completa tu perfil',
      'fr': 'Bienvenue sur EuroGet : complétez votre profil',
      'it': 'Benvenuto su EuroGet: completa il tuo profilo',
    },
    'ffhmmegw': {
      'en': 'Each section should only take a couple  of minutes to complete',
      'de':
          'Die Fertigstellung jedes Abschnitts sollte nur ein paar Minuten dauern',
      'es':
          'Cada sección solo debería tomar un par de minutos para completarse.',
      'fr':
          'Chaque section ne devrait prendre que quelques minutes à compléter',
      'it':
          'Il completamento di ciascuna sezione dovrebbe richiedere solo un paio di minuti',
    },
    '49jxcrjc': {
      'en': '1',
      'de': '1',
      'es': '1',
      'fr': '1',
      'it': '1',
    },
    '5q42mlg1': {
      'en': 'Your identify',
      'de': 'Ihr Name',
      'es': 'tu identidad',
      'fr': 'Votre identité',
      'it': 'La tua identità',
    },
    'wat5qwcx': {
      'en': 'Checking to make sure you and your ID match',
      'de': 'Wir prüfen, ob Sie und Ihr Ausweis übereinstimmen',
      'es': 'Verificar que usted y su identificación coincidan',
      'fr': 'Vérifier que vous et votre pièce d\'identité correspondent',
      'it': 'Stiamo controllando che tu e il tuo ID corrispondiate',
    },
    'mxo7qadq': {
      'en': '2',
      'de': '2',
      'es': '2',
      'fr': '2',
      'it': '2',
    },
    '61e1gzvo': {
      'en': 'Personal information',
      'de': 'Persönliche Angaben',
      'es': 'Informacion personal',
      'fr': 'Informations personnelles',
      'it': 'Informazione personale',
    },
    'mtzmv8nq': {
      'en': 'Details to ensure authenticity',
      'de': 'Details zur Gewährleistung der Authentizität',
      'es': 'Detalles para garantizar la autenticidad',
      'fr': 'Détails pour garantir l\'authenticité',
      'it': 'Dettagli per garantire l\'autenticità',
    },
    'pv3azikr': {
      'en': '3',
      'de': '3',
      'es': '3',
      'fr': '3',
      'it': '3',
    },
    'hogi6w00': {
      'en': 'Bank account connect',
      'de': 'Ihr Konto',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
      'it': 'Il tuo account',
    },
    '7y4ysdsh': {
      'en':
          'Connect your bank account, so we \ncan determine your credit limit',
      'de':
          'Richten Sie Ihre finanziellen Verbindungen ein und bestätigen Sie sie',
      'es': 'Configure y confirme sus conexiones financieras',
      'fr': 'Établissez et confirmez vos connexions financières',
      'it': 'Configura e conferma le tue connessioni finanziarie',
    },
    'mpg9biog': {
      'en': 'Get started',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ezyq9eoj': {
      'en': 'Your credit score is unaffected, and your info remains secure',
      'de':
          'Ihre Kreditwürdigkeit bleibt davon unberührt und Ihre Daten bleiben sicher',
      'es':
          'Su puntaje crediticio no se ve afectado y su información permanece segura',
      'fr':
          'Votre pointage de crédit n\'est pas affecté et vos informations restent sécurisées',
      'it':
          'Il tuo punteggio di credito non viene influenzato e le tue informazioni rimangono al sicuro',
    },
    'aa6dkdpv': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // Miscellaneous
  {
    'twx9njzb': {
      'en': 'Enable Notifications',
      'de': 'Benachrichtigungen aktivieren',
      'es': 'Permitir notificaciones',
      'fr': 'Activer les notifications',
      'it': 'Attivare le notifiche',
    },
    'ppgbtnnr': {
      'en': 'Enable Camera Access',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'el8o6q55': {
      'en': 'Enable Photo Library Access',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ewhudlvh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'b5g12vpg': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'v7j5f25w': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'dceaq19a': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'tod72aw4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ukwe3gp0': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'r7t2bxj3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '0dt9v6lz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'qno49980': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'alljy62b': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '8yjcupj8': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'ivoebz6r': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'i0ljw3sc': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'wqh9hcw4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '7vtiq15j': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '5d2w6iav': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'clo26pq6': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '14521q3y': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'dxykn2xh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '49zcq6kk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    's3fkv0qi': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '1i7e0rxp': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    '6x2tiukk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
    'z972txpy': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
    },
  },
].reduce((a, b) => a..addAll(b));
