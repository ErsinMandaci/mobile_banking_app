import 'package:banking_mobile_app/app/l10n/app_localizations.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/core/theme/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BankingMobileApp());
}

class BankingMobileApp extends StatelessWidget {
  const BankingMobileApp({super.key});

  Locale get _locale => const Locale('en', 'EN');

  AppRouter get _appRouter => AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      theme: AppThemeDark.getTheme(),
      routerConfig: _appRouter.config(),
    );
  }
}
