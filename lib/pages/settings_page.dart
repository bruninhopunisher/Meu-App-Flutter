import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/services/app_storage.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  AppStorageService storage = AppStorageService();

  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    receberNotificacoes = await storage.getDadosCadastraisReceberNotificacao();
    temaEscuro = await storage.getDadosCadastraisTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Olá, Bruno'),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromRGBO(43, 5, 73, 1),
          elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: ListView(
            children: [
              SwitchListTile(
                title: const Text('Recber Notificações'),
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                },
                value: receberNotificacoes,
              ),
              SwitchListTile(
                  title: const Text('Tema Escuro'),
                  value: temaEscuro,
                  onChanged: (bool value) {
                    setState(() {
                      temaEscuro = value;
                    });
                  }),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.fromLTRB(70, 15, 70, 15),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'SALVAR E ALTERAR',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 63, 4, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    await storage.setDadosCadastraisReceberNotificacao(
                        receberNotificacoes);
                    await storage.setDadosCadastraisTemaEscuro(temaEscuro);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
