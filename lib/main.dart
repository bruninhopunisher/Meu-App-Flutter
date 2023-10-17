import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meuprimeiroapp/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
  // runApp(
  //   EasyLocalization(
  //       supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
  //       path: 'assets/translations',
  //       fallbackLocale: const Locale('en', 'US'),
  //       child: const MyApp()),
  // );
}
