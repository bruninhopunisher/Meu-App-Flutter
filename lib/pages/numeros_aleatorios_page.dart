// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/services/app_storage.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({Key? key}) : super(key: key);

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int numeroGerado = 0;
  int qtdeCliques = 0;
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    numeroGerado = await storage.getDadosCadastraisReceberNumeroGerado();
    qtdeCliques = await storage.getDadosCadastraisReceberQTDEClique();
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
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null
                    ? "Nenhum número gerado"
                    : numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                numeroGerado == null
                    ? "Nenhum clique efetuado"
                    : qtdeCliques.toString(),
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              qtdeCliques = (qtdeCliques) + 1;
            });
            await storage.setDadosCadastraisNumeroGerado(numeroGerado);
            await storage.setDadosCadastraisQTDEClique(qtdeCliques);
          },
        ),
      ),
    );
  }
}
