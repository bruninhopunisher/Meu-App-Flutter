import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String _nome = 'Bruno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      appBar: AppBar(
        title: Text('Olá, $_nome'),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color(0x2D054901),
        elevation: 1,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/diver.png',
                width: 150,
                height: 150,
              ),
            ),
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
                    onTap: () {},
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
                    onTap: () {},
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home Page',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
