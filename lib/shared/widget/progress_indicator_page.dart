import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressIndicatorPage extends StatefulWidget {
  const ProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProgressIndicatorPageState createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  bool carregando = false;
  int progresso = 0;

  @override
  void initState() {
    super.initState();
    _iniciarCarregamentoAutomatico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(100),
              animation: true,
              animationDuration: 3000,
              lineHeight: 20,
              percent: 1,
              progressColor: Colors.white,
              backgroundColor: Colors.white70,
            ),
          ),
          Text(
            'Carregando $progresso%',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _iniciarCarregamentoAutomatico() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 25));
      setState(() {
        progresso = i;
      });
    }
  }
}
