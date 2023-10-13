class TarefaSQLiteModel {
  int id = 0;
  String _descricao = '';
  bool _concluido = false;

  TarefaSQLiteModel(this._descricao, this._concluido, bool bool);

  String get descricao => _descricao;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  bool get concluido => _concluido;

  set concluido(bool concluido) {
    _concluido = concluido;
  }
}
