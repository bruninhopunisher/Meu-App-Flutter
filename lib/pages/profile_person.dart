// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/services/app_storage.dart';
import '../../widget/text_label.dart';

class ProfilePerson extends StatefulWidget {
  const ProfilePerson({super.key});

  @override
  State<ProfilePerson> createState() => _ProfilePersonState();
}

class _ProfilePersonState extends State<ProfilePerson> {
  AppStorageService storage = AppStorageService();

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerDataNascimento =
      TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  DateTime? dataNascimento;
  double? altura;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    _controllerName.text = await storage.getDadosCadastraisNome();
    _controllerAltura.text = await storage.getDadosCadastraisAltura();
    _controllerEmail.text = await storage.getDadosCadastraisEmail();
    _controllerDataNascimento.text =
        await storage.getDadosCadastraisDataNascimento();
    if (_controllerDataNascimento.text.isNotEmpty) {
      dataNascimento = DateTime.parse(_controllerDataNascimento.text);
    }
    _controllerPassword.text = await storage.getDadosCadastraisSenha();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF820AD1),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Image.asset(
                  'assets/diver.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: const TextLabel(texto: 'Nome'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: _controllerName,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: const TextLabel(texto: 'Altura'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  controller: _controllerAltura,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: const TextLabel(texto: 'Email'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: const TextLabel(texto: 'Data de Nascimento'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                    keyboardType: TextInputType.datetime,
                    controller: _controllerDataNascimento,
                    readOnly: true,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.only(left: 15),
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () async {
                      // ignore: unused_local_variable
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900, 5, 20),
                          lastDate: DateTime.now());
                    }),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: const TextLabel(texto: 'Senha'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _controllerPassword,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      await storage.setDadosCadastraisAltura(
                          double.parse(_controllerAltura.text));
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text('Erro'),
                              content: const Text(
                                  'Altura inválida. Digite usando ponto. Ex: 1.70'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          });
                      return;
                    }
                    await storage.setDadosCadastraisNome(_controllerName.text);
                    await storage
                        .setDadosCadastraisEmail(_controllerEmail.text);
                    await storage
                        .setDadosCadastraisDataNascimento(dataNascimento!);
                    await storage
                        .setDadosCadastraisSenha(_controllerPassword.text);
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
