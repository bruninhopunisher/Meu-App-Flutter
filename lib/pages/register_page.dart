import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/pages/home_page.dart';

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
  bool _isObscureRegister = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      appBar: AppBar(
        title: const Text('Cadastro'),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color(0x2D054901),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Image.asset(
                'assets/diver.png',
                width: 200,
                height: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
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
                  hintText: AutofillHints.name,
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(40, 0, 40, 15),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
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
                  hintText: AutofillHints.email,
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(40, 0, 40, 15),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: TextField(
                controller: _controllerRegisterPassword,
                obscureText: _isObscureRegister,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Image.asset(_isObscureRegister
                        ? 'assets/olho_fechado.png'
                        : 'assets/olho_aberto.png'),
                    onPressed: () {
                      setState(() {
                        _isObscureRegister = !_isObscureRegister;
                      });
                    },
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  hintText: AutofillHints.password,
                  contentPadding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
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
                  backgroundColor: MaterialStateProperty.all(Colors.white),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
