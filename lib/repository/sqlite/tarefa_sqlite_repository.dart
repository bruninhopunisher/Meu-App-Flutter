import 'package:meuprimeiroapp/model/tarefa_model_sqlite.dart';
import 'package:meuprimeiroapp/repository/sqlite/database.dart';

class TarefaSQLiteRepository {
  Future<List<TarefaSQLiteModel>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefaSQLiteModel> tarefas = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? "SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0"
        : 'SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(TarefaSQLiteModel(
          int.parse(
            element["id"].toString(),
          ) as String,
          element["descricao"].toString() as bool,
          element["concluido"] == '1'));
    }
    return tarefas;
  }

  Future<void> salvar(TarefaSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)',
        [tarefaSQLiteModel.descricao, tarefaSQLiteModel.concluido]);
  }

  Future<void> atualizar(TarefaSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSQLiteModel.descricao,
      tarefaSQLiteModel.concluido ? 1 : 0,
      tarefaSQLiteModel.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}
