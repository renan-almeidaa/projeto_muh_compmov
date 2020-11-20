
class Usuario {

  String _idUsuario;
  String _nome;
  String _urlFoto;

  Usuario();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "nome" : this.nome,
    };

    return map;

  }


  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  String get urlImagem => _urlFoto;

  set urlImagem(String value) {
    _urlFoto= value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }


}