import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/pages/login_page.dart';
import 'package:meuprimeiroapp/pages/profile_person.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  leading: const Icon(Icons.person),
                  title: const Text(
                    'Meu Perfil',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 15, 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        exit(0);
                                      },
                                      child: const Text('Sim'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 10),
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
    );
  }
}
