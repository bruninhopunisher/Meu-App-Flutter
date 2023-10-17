import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestesPacotes extends StatefulWidget {
  const TestesPacotes({super.key});

  @override
  State<TestesPacotes> createState() => _TestesPacotesState();
}

class _TestesPacotesState extends State<TestesPacotes> {
  final TextEditingController controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'CEP',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const Text(
              'Telefone',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextFormField(
              controller: controllerPhone,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
