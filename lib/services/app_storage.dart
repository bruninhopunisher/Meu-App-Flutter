// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
enum STORAGE_CHAVES {
  CHAVE_NOME_USUARIO,
  CHAVE_DATA_NASCIMENTO,
  CHAVE_SENHA,
  CHAVE_ALTURA,
  CHAVE_EMAIL,
  CHAVE_NUMERO_GERADO_QUALQUER,
  CHAVE_TEMA_ESCURO,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_NUMERO_GERADO,
  CHAVE_QTDE_CLIQUES,
}

class AppStorageService {
  // SETS E GETS

  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

  Future<void> setDadosCadastraisEmail(String email) async {
    await _setString(STORAGE_CHAVES.CHAVE_EMAIL.toString(), email);
  }

  Future<String> getDadosCadastraisEmail() async {
    return _getString(STORAGE_CHAVES.CHAVE_EMAIL.toString());
  }

  Future<void> setDadosCadastraisAltura(double altura) async {
    await _setString(STORAGE_CHAVES.CHAVE_ALTURA.toString(), altura.toString());
  }

  Future<String> getDadosCadastraisAltura() async {
    return _getString(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }

  Future<void> setDadosCadastraisDataNascimento(DateTime data) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DATA_NASCIMENTO.toString(), data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async {
    return _getString(STORAGE_CHAVES.CHAVE_DATA_NASCIMENTO.toString());
  }

  Future<void> setDadosCadastraisSenha(String senha) async {
    await _setString(STORAGE_CHAVES.CHAVE_SENHA.toString(), senha.toString());
  }

  Future<String> getDadosCadastraisSenha() async {
    return _getString(STORAGE_CHAVES.CHAVE_SENHA.toString());
  }

  Future<void> setDadosCadastraisNumeroQualquer(int numero) async {
    await _setInt(
        STORAGE_CHAVES.CHAVE_NUMERO_GERADO_QUALQUER.toString(), numero);
  }

  Future<int> getDadosCadastraisNumeroQualquer() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_GERADO_QUALQUER.toString());
  }

  Future<void> setDadosCadastraisTemaEscuro(bool tema) async {
    await _setBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString(), tema);
  }

  Future<bool> getDadosCadastraisTemaEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString());
  }

  Future<void> setDadosCadastraisReceberNotificacao(bool notificacao) async {
    await _setBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString(), notificacao);
  }

  Future<bool> getDadosCadastraisReceberNotificacao() async {
    return _getBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }

  Future<void> setDadosCadastraisNumeroGerado(int numeroGerado) async {
    await _setInt(STORAGE_CHAVES.CHAVE_NUMERO_GERADO.toString(), numeroGerado);
  }

  Future<int> getDadosCadastraisReceberNumeroGerado() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_GERADO.toString());
  }

  Future<void> setDadosCadastraisQTDEClique(int clique) async {
    await _setInt(STORAGE_CHAVES.CHAVE_QTDE_CLIQUES.toString(), clique);
  }

  Future<int> getDadosCadastraisReceberQTDEClique() async {
    return _getInt(STORAGE_CHAVES.CHAVE_QTDE_CLIQUES.toString());
  }

  // FUNCAO SETS E GETS DE STRING, INT E BOOL AO BANCO DE DADOS LOCAL

  _setString(String chave, String value) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? '';
  }

  _setInt(String chave, int value) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  _setBool(String chave, bool value) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
