import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @onboardingFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'The best app for finance banking, & e-wallet today'**
  String get onboardingFirstTitle;

  /// No description provided for @onboardingSecondTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage finances easily, with secure payments'**
  String get onboardingSecondTitle;

  /// No description provided for @onboardingThirdTitle.
  ///
  /// In en, this message translates to:
  /// **'Have an amazing experience with AllPay right now'**
  String get onboardingThirdTitle;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get nextButton;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'transactions'**
  String get transactions;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'account number'**
  String get accountNumber;

  /// No description provided for @bankCart.
  ///
  /// In en, this message translates to:
  /// **'Bank Cart'**
  String get bankCart;

  /// No description provided for @crediCart.
  ///
  /// In en, this message translates to:
  /// **'Kredi Carts'**
  String get crediCart;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'home page'**
  String get home;

  /// No description provided for @myAccunt.
  ///
  /// In en, this message translates to:
  /// **'my accounts'**
  String get myAccunt;

  /// No description provided for @myCart.
  ///
  /// In en, this message translates to:
  /// **'My accounts'**
  String get myCart;

  /// No description provided for @transferMoney.
  ///
  /// In en, this message translates to:
  /// **'Transfer Money'**
  String get transferMoney;

  /// No description provided for @scanDocs.
  ///
  /// In en, this message translates to:
  /// **'Document scanning'**
  String get scanDocs;

  /// No description provided for @demandDepositAccount.
  ///
  /// In en, this message translates to:
  /// **'Demand Deposit TL Account'**
  String get demandDepositAccount;

  /// No description provided for @letsYouIn.
  ///
  /// In en, this message translates to:
  /// **'You are Inside Let\'s take it'**
  String get letsYouIn;

  /// No description provided for @googleContinue.
  ///
  /// In en, this message translates to:
  /// **'continue with google'**
  String get googleContinue;

  /// No description provided for @appleContinue.
  ///
  /// In en, this message translates to:
  /// **'continue with apple'**
  String get appleContinue;

  /// No description provided for @signWithPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign in with password'**
  String get signWithPassword;

  /// No description provided for @loginToYour.
  ///
  /// In en, this message translates to:
  /// **'Login to your'**
  String get loginToYour;

  /// No description provided for @accout.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accout;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error'**
  String get error;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'SignIn'**
  String get signIn;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or Continue with'**
  String get orContinueWith;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'SignUp'**
  String get signUp;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'tr': return L10nTr();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
