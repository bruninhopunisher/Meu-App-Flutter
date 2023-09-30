import 'dart:async';

class ImageRepository {
  Future<List<Map<String, String>>> getImagens() async {
    await Future.delayed(const Duration(milliseconds: 3150));

    List<String> imageUrl = [
      'assets/img1.jpg',
      'assets/img2.jpg',
      'assets/img3.webp',
      'assets/img4.jpg',
      'assets/img5.webp',
    ];

    List<String> description = [
      'Quadro negro de matemática',
      'Mulher Correndo',
      'Mulher Nadando',
      'Piscina olímpica',
      'Popó de Freitas, boxeador brasileiro',
    ];

    List<Map<String, String>> imagensEDescricoes = [];

    for (int i = 0; i < imageUrl.length; i++) {
      imagensEDescricoes
          .add({"caminho": imageUrl[i], "descricao": description[i]});
    }

    return imagensEDescricoes;
  }
}
