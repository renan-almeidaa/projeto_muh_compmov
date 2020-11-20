import 'package:flutter/material.dart';

class Fot extends StatefulWidget {


  final String _preco;
  final String _descricao;
  final String _imagem;

  Fot(this._preco, this._descricao, this._imagem);
  @override
  _Fot createState() => _Fot(_preco, _descricao, _imagem);
}

class _Fot extends State<Fot> {

  final String _preco;
  final String _descricao;
  final String _imagem;

  _Fot(this._preco,  this._descricao,  this._imagem);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            this._imagem
          ),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
