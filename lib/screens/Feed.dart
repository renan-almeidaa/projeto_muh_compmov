import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/Foto.dart';
import 'package:scoped_model/scoped_model.dart';

class FeedPerfil extends StatefulWidget {

  final UserModel model;

  FeedPerfil(this.model);

  @override
  _FeedPerfil createState() => _FeedPerfil(this.model);
}



class _FeedPerfil extends State<FeedPerfil> {

  final UserModel model;

  _FeedPerfil(this.model);

  @override
  Widget build(BuildContext context) {

    return  Container(
      child: Column(
        children: [
          Wrap(
            children: [
              Foto(model.preco[0], model.descricao[0], model.imagem[0]),
              Foto(model.preco[1], model.descricao[1], model.imagem[1]),
              Foto(model.preco[2], model.descricao[2], model.imagem[2]),
              Foto(model.preco[1], model.descricao[1], model.imagem[1]),
              Foto(model.preco[2], model.descricao[2], model.imagem[2]),
              Foto(model.preco[1], model.descricao[1], model.imagem[1]),
              Foto(model.preco[2], model.descricao[2], model.imagem[2]),
              Foto(model.preco[0], model.descricao[0], model.imagem[0])
            ],
          )
        ],
      ),
    );


  }
}
