import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meuprimeiroapp/pages/image_picker.dart';
import 'package:meuprimeiroapp/pages/qr_code.dart';
import 'package:meuprimeiroapp/pages/login_page.dart';
import 'package:meuprimeiroapp/pages/numeros_aleatorios_page.dart';
import 'package:meuprimeiroapp/pages/profile_person.dart';
import 'package:meuprimeiroapp/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/diver.png'),
                ),
                accountName: Text('Bruno Silva Souza'),
                accountEmail: Text('email@email.com'),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(43, 5, 73, 1),
                )),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ListBody(
                children: [
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.userNinja,
                      color: Colors.green,
                      size: 25,
                    ),
                    title: const Text(
                      'Meu Perfil',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePerson(),
                        ),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text(
                      'Configurações',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfiguracoesPage(),
                        ),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const Icon(Icons.numbers),
                    title: const Text(
                      'Gerador de Números',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NumerosAleatoriosPage(),
                        ),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.camera),
                    title: const Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraPage(),
                        ),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'Sair',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'QR Code',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QRCodePage(),
                        ),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text(
                      'INTL',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      var f = NumberFormat('#,###.00', 'en_US');
                      var fBR = NumberFormat('##.0#', 'pt_BR');
                      stdout.write(f.format(12345));
                      stdout.write(fBR.format(12345));
                    },
                  ),
                  // const Padding(padding: EdgeInsets.only(top: 25)),
                  // ListTile(
                  //   leading: const Icon(Icons.flag),
                  //   title: const Text(
                  //     'IDIOMA',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     if (context.locale.toString() == "pt_BR") {
                  //       context.setLocale(Locale('en', 'US'));
                  //     } else {
                  //       context.setLocale(Locale('pt', 'BR'));
                  //     }
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  ListTile(
                    leading: const Icon(Icons.cancel),
                    title: const Text(
                      'Parar Aplicação',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          context: context,
                          builder: (BuildContext bc) {
                            return Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Tem certeza que deseja zerar a aplicação?",
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 15, 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          exit(0);
                                        },
                                        child: const Text('Sim'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 0, 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Não'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
