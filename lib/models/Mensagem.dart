class Mensagem {

  String _idUsuario;
  String _mensagem;
  String _data;

  Mensagem();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "idUsuario" : this.idUsuario,
      "mensagem"  : this.mensagem,
      "data"      : this.data,
    };

    return map;

  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }

  String get mensagem => _mensagem;

  set mensagem(String value) {
    _mensagem = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

}