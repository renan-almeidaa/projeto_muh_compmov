import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaPrincipal extends StatefulWidget {

  final List name;

  TelaPrincipal(this.name);


  @override
  _TelaPrincipalState createState() => _TelaPrincipalState(this.name);

}

class _TelaPrincipalState extends State<TelaPrincipal> {

  final List name;

  _TelaPrincipalState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset("assets/vakinha.png", alignment: Alignment.center, scale: 3.5,),
        actions: [
          RaisedButton(
            // color: Colors.white,
            //padding: EdgeInsets.only(0.2),
            child:
            Icon(Icons.message),
            color: Colors.white,
            onPressed: () {
              print("nomezinhos :" + this.name.toString());
            },
          ),
        ],
      ),

      drawer: CustomDrawer(this.name),
    );
  }
}