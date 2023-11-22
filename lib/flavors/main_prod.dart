import 'package:banking_mobile_app/starter.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  Flavor.create(
    Environment.production,
    name: 'Production',
    color: Colors.blue,
  );
  await StarterApp.launchApp();
}
