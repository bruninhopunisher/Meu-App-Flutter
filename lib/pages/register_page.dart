import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/model/navegatorBar_appBar.dart';
import 'package:meuprimeiroapp/shared/widget/progress_indicator_page.dart';
import 'package:meuprimeiroapp/shared/widget/text_label.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerRegisterEmail =
      TextEditingController();
  final TextEditingController _controllerRegisterName = TextEditingController();
  final TextEditingController _controllerRegisterPassword =
      TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();

  final TextEditingController _controllerDataNascimento =
      TextEditingController();
  DateTime? dataNascimento;
  double _idade = 0;

  bool _salvar = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF820AD1),
        appBar: AppBar(
          title: const Text('Cadastro'),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromRGBO(43, 5, 73, 1),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: _salvar
              ? const ProgressIndicatorPage()
              : Column(
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: const TextLabel(texto: 'Nome'),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextField(
                        controller: _controllerRegisterName,
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
                        controller: _controllerRegisterEmail,
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
                            var data = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900, 5, 20),
                                lastDate: DateTime.now());
                            if (data != null) {
                              _controllerDataNascimento.text = data.toString();
                              dataNascimento = data;
                            }
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                      child: const TextLabel(texto: 'Senha'),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextField(
                        controller: _controllerRegisterPassword,
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
                      margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                      child: const TextLabel(texto: 'Confirme sua senha'),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextField(
                        controller: _controllerConfirmPassword,
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
                      margin: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                      child: TextLabel(
                          texto: 'Selecione seu número:  ${_idade.round()}'),
                    ),
                    Slider(
                      min: 0,
                      max: 10,
                      value: _idade,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      thumbColor: Colors.pink,
                      onChanged: (double value) {
                        setState(() {
                          _idade = value;
                        });
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(0, 25, 0, 50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.fromLTRB(80, 15, 80, 15),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Text(
                          'CADASTRAR',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 63, 4, 102),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (_controllerRegisterName.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('O campo de nome não pode ser vazio'),
                              ),
                            );
                            return;
                          }
                          if (_controllerRegisterEmail.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Digite um email para o cadastro'),
                              ),
                            );
                            return;
                          }
                          if (_controllerDataNascimento.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Selecione sua data de nascimento'),
                              ),
                            );
                            return;
                          }
                          if (_controllerRegisterPassword.text.trim().length <
                              4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'A senha deve ter mais de 4 caracteres'),
                              ),
                            );
                            return;
                          }
                          if (_controllerRegisterPassword.text.trim().length !=
                              _controllerConfirmPassword.text.trim().length) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('As senhas são diferentes'),
                              ),
                            );
                            return;
                          }
                          setState(() {
                            _salvar = true;
                          });
                          Future.delayed(const Duration(seconds: 5), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Usuário cadastrado com sucesso'),
                              ),
                            );
                            setState(() {
                              _salvar = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BarraNavegacao(),
                              ),
                            );
                          });
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
