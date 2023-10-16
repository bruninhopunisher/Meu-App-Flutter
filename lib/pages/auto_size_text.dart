import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSize extends StatefulWidget {
  const AutoSize({super.key});

  @override
  State<AutoSize> createState() => _AutoSizeState();
}

class _AutoSizeState extends State<AutoSize> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: const AutoSizeText(
            'O Fabuloso Gerador de Lero-lero v2.0 é capaz de gerar qualquer quantidade de texto vazio e prolixo, ideal para engrossar uma tese de mestrado, impressionar seu chefe ou preparar discursos capazes de curar a insônia da platéia. Basta informar um título pomposo qualquer (nos moldes do que está sugerido aí embaixo) e a quantidade de frases desejada. Voilá! Em dois nano-segundos você terá um texto - ou mesmo um livro inteiro - pronto para impressão. Ou, se preferir, faça copy/paste para um editor de texto para formatá-lo mais sofisticadamente. Lembre-se: aparência é tudo, conteúdo é nada. O lerolero filosófico foi publicado originalmente no portal http://lerolero.hdfree.com.br/, que infelizmente não existe mais. No intuito de preservar esta obra de arte, eu recuperei o conteúdo do portal original a partir do site Archive.org e republiquei-o aqui. A seguir, a descrição do site, copiada do portal original. Divirtam-se!',
            maxLines: 30,
          ),
        ),
      ),
    );
  }
}
