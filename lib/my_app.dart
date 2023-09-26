import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuprimeiroapp/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
