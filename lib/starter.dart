import 'package:banking_mobile_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final class StarterApp {
  static Future<void> launchApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const BankingMobileApp());
  }
}
