import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:scoped_model/scoped_model.dart';

File _image;

pickImageFromGallery(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final PickedFile image = await picker.getImage(source: source);

  setState(() {
    _image = File(image.path);
  });
}

void setState(Null Function() param0) {
}


class FazendaSelecionadaScreen extends StatefulWidget {
  final String _idfarm;
  FazendaSelecionadaScreen(this._idfarm);

  @override


  _FazendaSelecionadaScreenState createState() => _FazendaSelecionadaScreenState(_idfarm);
}



class _FazendaSelecionadaScreenState extends State<FazendaSelecionadaScreen> {
  final String id;
  TextEditingController _nomedogrupo = TextEditingController();
  TextEditingController _tipo        = TextEditingController();
  TextEditingController _qtdProdutos = TextEditingController();


  _FazendaSelecionadaScreenState(this.id);
  List<String> _locations = ['Arboricultura', 'Cacauicultura', 'Citricultura', 'Flor de Corte', 'Floricultura', 'Forragicultura', 'Fruticultura', 'Haveicultura',
    'Horticultura', 'Olericultura', 'Olivicultura', 'Rizicultura', 'Subericultura']; // Option 2
  String _selectedLocation; // Option 2

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
                // vai para as mensagens...
              },
            ),
          ],

        ),
        body:ScopedModelDescendant<UserModel>(
            builder: (context, child, model)  {
              Future<String> nome =  model.pegaNomedeumaFazenda(id);
              return Container(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: new Center(
                                child: Text(id),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                                color: Colors.white,
                                child: TextField(
                                  controller: _nomedogrupo,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 25, height:1),

                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10,10,10,10),
                                    hintText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    labelText: "Nome do novo grupo",
                                    isDense: false,
                                  ),
                                ),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: new Center(
                                child: DropdownButton(
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 20,
                                  elevation: 20,
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 3,
                                    color: Colors.black87,
                                  ),
                                  hint: Text('Selecione um tipo...'), // Not necessary for Option 1
                                  value: _selectedLocation,
                                  onChanged: (valor) {
                                    setState(() {
                                      _selectedLocation = valor;
                                    });
                                  },
                                  items: _locations.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),


                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Container(
                                width: 10,
                                height: 70,
                                margin: EdgeInsets.only(left: 50, right: 50),
                                color: Colors.white,
                                child: TextField(
                                  controller: _qtdProdutos,
                                  autofocus: false,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 25, height:1),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10,10,10,10),
                                    hintText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    labelText: "Quantidade de produtos",
                                    labelStyle: TextStyle(fontSize: 18, height:1),
                                    isDense: false,
                                  ),
                                ),
                              ),

                            ),


                            Padding(
                              padding: EdgeInsets.only(bottom: 20, left:0),
                              child: new Container(

                                child: new Row(
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.black,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.add_photo_alternate,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "Imagem",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        // adiciona uma nova imagem...
                                        pickImageFromGallery(
                                            ImageSource.gallery);
                                      },
                                    ),
                                    Spacer(),
                                    RaisedButton(
                                      color: Colors.black,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.library_add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "Novo Item",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder:  (context) => ItemRegister(this.id)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Text("Itens",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        // height: 100.0,
                                        color: Colors.black),

                                  ),


                                  child: Column(
                                    children: <Widget>[
                                      Text("Item 1 | Destalhes | Publico ou Privado? |",style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),textAlign: TextAlign.left),
                                      Text("Item 2 | Destalhes | Publico ou Privado? |",style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),textAlign: TextAlign.left),
                                    ],
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0, left:0, top: 40),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(color: Colors.black)),
                                color: Colors.black,
                                padding: EdgeInsets.all(1),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(1),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        "CADASTRAR NOVO TIPO",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,

                                        ),

                                      ),

                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Map<String,dynamic> ProdutoData = {
                                    'name': _nomedogrupo.text,
                                    'tipo': _selectedLocation,
                                    'quantidade produtos': _qtdProdutos.text,
                                    'image': ""
                                  };
                                  model.criarTipo(id,ProdutoData, _image);
                                },
                              ),
                            )
                          ]
                      ),
                    ),
                  )
              );
              drawer: Drawer(

                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: const <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Profile'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                  ],
                ),
              );
            }
        )




    );
  }
}