// TELA AMANDA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/utils/default_scaffold.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/feed/ifeed.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Publications  extends StatefulWidget {
  final String _img;
  final String desc;
  final String preco;
  final String nome;
  final String data;
  final String img_perfil;
  @override
  _Publications createState() => _Publications(this._img, this.desc,this.preco,this.nome,this.data,this.img_perfil);

  Publications(this._img, this.desc,this.preco,this.nome,this.data,this.img_perfil);
} // class Publications
final _scaffoldKey = GlobalKey<ScaffoldState>();

class _Publications extends State<Publications> {
  final String _img;
  final String desc;
  final String preco;
  final String nome;
  final String data;
  final String img_perfil;
  _Publications(this._img, this.desc,this.preco,this.nome,this.data,this.img_perfil);
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        iconTheme: new IconThemeData(color: Colors.black),

        title: Image.asset(
          "assets/vakinha.png",
          alignment: Alignment.center,
          scale: 3.5,
        ),

      ),

      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
                        child:
                        Text(data,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none),)
                        ,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
                      child:
                        Text(nome,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),


                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                          alignment: Alignment.center,
                        child: Align(
                            child: FadeInImage.assetNetwork(
                          placeholder: 'assets/loading.gif',
                          image: _img,
                          fadeInDuration: const Duration(seconds: 1),
                          fit: BoxFit.fitWidth,
                        )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
                      child: Text(desc,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0, left: 5, right: 5),
                      child: Text('Produto por: ' + preco,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      drawer: CustomDrawer(),
    );
  } // Widget build
} //_Publications



