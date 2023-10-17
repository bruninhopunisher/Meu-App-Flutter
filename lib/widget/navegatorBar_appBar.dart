// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meuprimeiroapp/pages/card_page.dart';
import 'package:meuprimeiroapp/pages/consulta_cep.dart';
import 'package:meuprimeiroapp/pages/image_page.dart';
import 'package:meuprimeiroapp/pages/posts_page.dart';
import 'package:meuprimeiroapp/pages/teste_pacotes.dart';
import '../../../../widget/custom_drawer.dart';
import 'package:line_icons/line_icons.dart';

class BarraNavegacao extends StatefulWidget {
  const BarraNavegacao({super.key});

  @override
  State<BarraNavegacao> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BarraNavegacao> {
  int _selectedIndex = 0;
  // final String _name = 'Bruno';

  static final List<Widget> _widgetOptions = [
    const CardPage(),
    const PostsPage(),
    const ImagePage(),
    const ConsultaCEP(),
    const TestesPacotes()
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
          title: Text("APP_TITLE".tr()),
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
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 40),
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
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            child: GNav(
              rippleColor: const Color.fromRGBO(43, 5, 73, 1),
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 100),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                ),
                GButton(
                  icon: LineIcons.list,
                ),
                GButton(
                  icon: LineIcons.heart,
                ),
                GButton(
                  icon: LineIcons.getPocket,
                ),
                GButton(
                  icon: LineIcons.addressBook,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
