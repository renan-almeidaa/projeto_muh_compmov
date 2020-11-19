import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/Foto.dart';
import 'package:scoped_model/scoped_model.dart';

Foto1(UserModel model){

  for(int i=0; i< model.preco.length; i++){
    Foto(model.preco[i], model.descricao[i], model.imagem[i]);
  }

}

class FeedPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return  Container(
            child: FutureBuilder(
              future: model.getItems(widget._idFazenda, widget._idProduto),
              builder: (_, snapshot) {

              }
            )
          );
        }
    );

  }
}
