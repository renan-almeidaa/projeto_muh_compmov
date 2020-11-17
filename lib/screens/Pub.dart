import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/Perfil.dart';

import 'package:scoped_model/scoped_model.dart';

class Pub  extends StatefulWidget {

  @override
  _Pub createState() => _Pub();

}

class _Pub extends State<Pub> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _preco = TextEditingController();


  imagemAdicionada(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Imagem adicionada!"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('OK'),
            onPressed: () {
              yesorno = "Imagem já selecionada!";
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  } // popup

  popup(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Publicação salva!"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) => Perfil())
              );
            },
          )
        ],
      );
    });
  } // popup

  popupDeuErrado(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Publicação não foi salva!"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('TENTAR NOVAMENTE'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) => Pub())
              );
            },
          )
        ],
      );
    });
  }


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _mensagemErro = "";

  File _image;
  String yesorno = "Sem imagem selecionada!";

  pickImageFromGallery(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final PickedFile image = await picker.getImage(source: source);

    setState(() {
      _image = File(image.path);
    });
  }

  _validarCampos() {
    String des = _descriptionController.text;
    String qtd = _preco.text;

    if (des.isNotEmpty) {
      if(_image != null) {

      }else { _mensagemErro = "Adicione uma imagem!";}
      if (qtd.isNotEmpty) {

        } else {
          setState(() {
            _mensagemErro = "Coloque um preço!";
          });
        }
      }
     else {
      setState(() {
        _mensagemErro = "Coloque uma descrição!";
      });
    }
  }

  @override
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
          leading: RaisedButton(
            color: Colors.white,
            // color: Colors.black12,
            child: Icon(
              Icons.dehaze,
              color: Colors.black,
            ),
            onPressed: () {

            },
          ),
          actions: [
            RaisedButton(
              // color: Colors.white,
              //padding: EdgeInsets.only(0.2),
              child: Icon(
                Icons.chat,
                color: Colors.black,
              ),
              color: Colors.white,
              // color: Colors.black12,
              onPressed: () {
                // vai para as mensagens...
              },
            ),
          ],
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
                        padding: EdgeInsets.only(top: 5, bottom: 0),
                        child: Text("Nova publicação",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.all(50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(yesorno,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                      decoration: TextDecoration.none),
                                ),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom:0,left:70),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [


                                    RaisedButton.icon(
                                      onPressed: () {
                                        pickImageFromGallery(
                                            ImageSource.gallery);
                                        imagemAdicionada(context);
                                      },

                                      icon: Icon(
                                        Icons.add_photo_alternate,
                                        color: Colors.black,

                                      ),
                                      label: Text(
                                        "Adicionar uma foto",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      elevation: 0,
                                      // color: Colors.white,
                                      color: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(600,600)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 150,
                                    child: TextFormField(
                                      controller: _descriptionController,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 6,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        hintText: "Descrição",
                                        filled: true,
                                        fillColor: Colors.white,
                                        // fillColor: Color(0xFFF4F5F6),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                                          borderSide: BorderSide(),
                                        ),
                                      ),

                                    ),
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 150,
                                    width: 95,
                                    child: TextField(
                                      controller: _preco,
                                      autofocus: false,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 25, height:1),

                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10,10,10,10),
                                        hintText: "",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(92),
                                        ),
                                        labelText: "Preço",
                                        isDense: false,
                                      ),
                                    ),
                                    ),
                                  )
                              ),



                          ],
                        ),
                      ),
                      Align(
                          child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(30.0)),
                              color: Colors.black,
                              onPressed: () {
                                _validarCampos();

                                if (_mensagemErro != "") {
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        _mensagemErro,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  popupDeuErrado(context);
                                }else {

                                   Map<String,dynamic> publication = {
                                    'image': "",
                                   'descrição': _descriptionController.text,
                                   'preço': _preco.text,

                                  };
                                  popup(context);

                                  model.newPublication(publication, _image);
                                  model.generalPublication(publication, _image);

                                }
                              },
                              child: Text(
                                "SALVAR PUBLICAÇÃO",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ))),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        drawer: CustomDrawer(),
    );
  }

}


