// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meuprimeiroapp/pages/card_page.dart';
import 'package:meuprimeiroapp/pages/image_page.dart';
import 'package:meuprimeiroapp/shared/widget/custom_drawer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meuprimeiroapp/shared/widget/progress_indicator_page.dart';

class BarraNavegacao extends StatefulWidget {
  const BarraNavegacao({super.key});

  @override
  State<BarraNavegacao> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BarraNavegacao> {
  int _selectedIndex = 0;
  final String _name = 'Bruno';

  static final List<Widget> _widgetOptions = <Widget>[
    FutureBuilder<CardPage>(
      future: getChamaPagina(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else {
          return const ProgressIndicatorPage();
        }
      },
    ),
    const ImagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          backgroundColor: const Color(0xFF820AD1),
          appBar: AppBar(
            title: Text('Olá, $_name'),
            titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromRGBO(43, 5, 73, 1),
            elevation: 1,
          ),
          drawer: const CustomDrawer(),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.fromLTRB(100, 0, 100, 40),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: const Color.fromRGBO(43, 5, 73, 1),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: GNav(
                rippleColor: const Color.fromRGBO(43, 5, 73, 1),
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 100),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.white,
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Início',
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Hello',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ));
  }
}

Future<CardPage> getChamaPagina() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  const ProgressIndicatorPage();
  await Future.delayed(const Duration(seconds: 1));
  return const CardPage();
}
