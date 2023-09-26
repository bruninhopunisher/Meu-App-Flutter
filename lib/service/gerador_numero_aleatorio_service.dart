import 'dart:math';

class GeradorNumericoAleatorioService {
  static int gerarNumeroAleatorio(int maximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(maximo);
  }
}
