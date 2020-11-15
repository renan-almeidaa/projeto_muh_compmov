
class Conversa {
  String _nome;
  String _mensagem;
  String _urlFoto;

  Conversa(this._nome, this._mensagem, this._urlFoto);

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get mensagem => _mensagem;

  String get urlFoto => _urlFoto;

  set urlFoto(String value) {
    _urlFoto = value;
  }

  set mensagem(String value) {
    _mensagem = value;
  }
}