import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/model/viacep_model.dart';
import 'package:meuprimeiroapp/repository/posts/impl/via_cep_repository_http.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  final TextEditingController _controllerCEP = TextEditingController();
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCepRepository = ViaCepHTTPRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      body: Column(
        children: [
          const Text(
            'Consulta de CEP',
          ),
          TextField(
            maxLength: 8,
            keyboardType: TextInputType.number,
            controller: _controllerCEP,
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
            onChanged: (value) async {
              var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
              if (cep.length >= 8) {
                setState(() {
                  loading = true;
                });
                viacepModel = await viaCepRepository.consultarCEP(cep);
              }
              setState(() {
                loading = false;
              });
            },
          ),
          Text(
            viacepModel.logradouro ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${viacepModel.localidade ?? ''} - ${viacepModel.uf ?? ''}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (loading) const CircularProgressIndicator(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
