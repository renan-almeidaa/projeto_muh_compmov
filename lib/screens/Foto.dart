import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/Fot.dart';



class Foto  extends StatefulWidget {

  final String _preco;
  final String _descricao;
  final String _imagem;

  Foto(this._preco, this._descricao, this._imagem);


  @override
  _Foto createState() => _Foto(_preco, _descricao, _imagem);

}

class _Foto extends State<Foto> {

  final String _preco;
  final String _descricao;
  final String _imagem;

  _Foto(this._preco,  this._descricao,  this._imagem);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        height: MediaQuery.of(context).size.width/3 - 3,
        width: MediaQuery.of(context).size.width/3 - 3,
        child: Fot(this._preco, this._descricao, this._imagem),
      ),
    );
  }
}
