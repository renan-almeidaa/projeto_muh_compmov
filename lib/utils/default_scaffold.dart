
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class DefaultScaffold extends StatelessWidget {
  final List _nomes = new List();
  final Color backgroundColor;
  final Widget _bodyWidget;
  final Widget _button;

  DefaultScaffold({@required Widget bodyWidget, this.backgroundColor = Colors.white, Widget floatingButton})
      : this._bodyWidget = bodyWidget, this._button = floatingButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Image.asset("assets/vakinha.png", alignment: Alignment.center, scale: 3.5,),

      ),

      // O certo é o ScopedModelDescendant estar dentro do CustomDrawer, assim não sendo mais necessário passar
      // a lista de nomes do model para o construtor.
      // Dessa forma o body: pode simplesmente conter o "_bodyWidget", com isso fica a critério do Widget do body
      // implementar ou não um ScopedModelDescendant.
      // Fazendo este ajuste não será mais necessário possuir a constante "_nomes" nessa classe.
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if(model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            this._nomes.addAll(model.nome);
            return _bodyWidget;
          }
        }
      ),
      drawer: CustomDrawer(),
      floatingActionButton: this._button,
    );
  }

}