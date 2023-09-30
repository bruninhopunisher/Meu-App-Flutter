import 'package:meuprimeiroapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return CardDetail(
      1,
      'Bruno Silva Souza',
      'assets/diver.png',
      'Lorem ipsum dolor sit amet. Est recusandae officia sit omnis galisum est provident voluptatem eos asperiores vitae eos sunt adipisci et labore commodi ut dolor fugiat. Aut corporis officiis eum incidunt soluta qui dolore magnam et consequatur dolore qui inventore voluptate qui consequuntur veritatis. Aut quia natus aut voluptate tempore cum reiciendis laborum ut dignissimos quia aut maxime repellendus sit suscipit recusandae.',
    );
  }
}
