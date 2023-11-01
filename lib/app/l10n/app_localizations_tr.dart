import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get onboardingFirstTitle => 'Finans bankacılığı için en iyi uygulama ve bugün e-wallet';

  @override
  String get onboardingSecondTitle => 'güvenli Ödemelerle Finansmanı Kolayca Yönetin';

  @override
  String get onboardingThirdTitle => 'Şu anda AllPay ile harika bir deneyim yaşayın';

  @override
  String get nextButton => 'Next';
}
