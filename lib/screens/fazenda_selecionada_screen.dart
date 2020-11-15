import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  //debugShowCheckedModeBanner: true;
}

class FazendaSelecionadaScreen  extends StatefulWidget {
  final String _nomefazenda;
  final String _idFazenda;

  FazendaSelecionadaScreen(this._nomefazenda, this._idFazenda);


  @override
  _FazendaSelecionadaScreenState createState() => _FazendaSelecionadaScreenState(_nomefazenda, _idFazenda);

}

class _FazendaSelecionadaScreenState extends State<FazendaSelecionadaScreen> {
  final String _nomefazenda;
  final String _idFazenda;

  popup(BuildContext context, var idProduto) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Novo tipo adicionado com sucesso!"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemRegister(_idFazenda, idProduto ,_nomefazenda))
              );
            },
          )
        ],
      );
    });
  }

  popupDeuErrado(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Novo tipo não foi adicionado! Tente novamente..."),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FazendaSelecionadaScreen(_nomefazenda, _idFazenda))
              );
            },
          )
        ],
      );
    });
  }
  _FazendaSelecionadaScreenState(this._nomefazenda, this._idFazenda);

  List<String> _productions = ['Arboricultura', 'Cacauicultura', 'Citricultura', 'Flor de Corte', 'Floricultura', 'Forragicultura', 'Fruticultura', 'Haveicultura',
    'Horticultura', 'Olericultura', 'Olivicultura', 'Rizicultura', 'Subericultura'];
  String _productionSel;
  final TextEditingController _nomedogrupo = TextEditingController();
  final TextEditingController _qtdProdutos = TextEditingController();
//  final TextEditingController _adressController = TextEditingController();
//  final TextEditingController _descriptionController =  TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _mensagemErro = "";

  File _image;

  pickImageFromGallery(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final PickedFile image = await picker.getImage(source: source);

    setState(() {
      _image = File(image.path);
    });
  }

  _validarCampos() {
    String nome = _nomedogrupo.text;
    String qtd = _qtdProdutos.text;

    List<String> producoes = _productions;
    String produtoSelecionado = _productionSel;
    if (nome.isNotEmpty) {
      if (qtd.isNotEmpty) {
        if (producoes.contains(produtoSelecionado)) {
          setState(() {
            //  _mensagemErro = "Quantidade não pode ser vazia";
          });
        } else {
          setState(() {
            _mensagemErro = "Selecione um ramo!";
          });
        }
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o nome";
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
          // backgroundColor: Colors.black87,
          iconTheme: new IconThemeData(color: Colors.black),
          //  leading: Image.asset("imagens/cow.png"),
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
                        padding: EdgeInsets.only(top: 25, bottom: 20),
                        child: Text(_nomefazenda,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextField(
                                  controller: _nomedogrupo,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 25, height:1),

                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10,10,10,10),
                                    hintText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: "Nome do novo grupo",
                                    isDense: false,
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 50, bottom: 5),
                                  child: TextField(
                                    controller: _qtdProdutos,
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 25, height:1),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(10,10,10,10),
                                      hintText: "",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: "Quantidade de produtos",
                                      // labelStyle: TextStyle(fontSize: 18, height:1),
                                      isDense: false,
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
//                                Text(
//                                  "Quantidade de Produtos:",
//                                  style: TextStyle(
//                                    fontSize: 25,
//                                    fontStyle: FontStyle.normal,
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
//                                  child: TextField(
//                                    controller: _adressController,
//                                    style: TextStyle(
//                                      fontSize: 17,
//                                    ),
//                                    keyboardType: TextInputType.streetAddress,
//                                    decoration: InputDecoration(
//                                        contentPadding:
//                                        EdgeInsets.fromLTRB(15, 15, 15, 15),
//                                        hintText: "Digite o endereço",
//                                        border: OutlineInputBorder(
//                                            borderRadius:
//                                            BorderRadius.circular(15))),
//                                  ),
                                ),
                              ],
                            ),
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
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: new Center(
//                                    child: DropdownButton(
//                                      icon: Icon(Icons.arrow_downward),
//                                      iconSize: 20,
//                                      elevation: 20,
//                                      style: TextStyle(color: Colors.black),
//
//                                      hint: Text(
//                                          'Escolha o ramo...'), // Not necessary for Option 1
//                                      value: _productionSel,
//                                      onChanged: (newValue) {
//                                        setState(() {
//                                          _productionSel = newValue;
//                                        });
//                                      },
//                                      items: _productions.map((location) {
//                                        return DropdownMenuItem(
//                                          child: new Text(location),
//                                          value: location,
//                                        );
//                                      }).toList(),
//                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownButton(
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 20,
                                      elevation: 20,
                                      style: TextStyle(color: Colors.black),

                                      hint: Text(
                                          'Escolha o ramo...'), // Not necessary for Option 1
                                      value: _productionSel,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _productionSel = newValue;
                                        });
                                      },
                                      items: _productions.map((location) {
                                        return DropdownMenuItem(
                                          child: new Text(location),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),

                                    RaisedButton.icon(
                                      onPressed: () {
                                        pickImageFromGallery(
                                            ImageSource.gallery);
                                      },
                                      icon: Icon(
                                        Icons.add_photo_alternate,
                                        color: Colors.black,

                                      ),
                                      label: Text(
                                        "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      elevation: 0,
                                      // color: Colors.white,
                                      color: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(300,300)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

//                            Row(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                RaisedButton.icon(
//                                  onPressed: () {
//                                    Navigator.of(context).push(
//                                        MaterialPageRoute(builder: (context) => ItemRegister(_idFazenda,"E0zreBV00nFJNS4VQQUi" ,_nomefazenda))
//                                    );
//                                  },
//                                  icon: Icon(
//                                    Icons.add_circle_outline,
//                                    color: Colors.black,
//
//                                  ),
//                                  label: Text(
//                                    "Adicionar item...",
//                                    style: TextStyle(
//                                      fontWeight: FontWeight.w600,
//                                    ),
//                                  ),
//                                  elevation: 0,
//                                  // color: Colors.white,
//                                  color: Colors.white70,
//                                  shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.all(
//                                        Radius.elliptical(300,300)),
//                                  ),
//                                ),
//                              ],
//                            ),
                          ],
                        ),
                      ),
                      Align(
                          child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(30.0)),
                              color: Colors.black,
                              onPressed: () async {
                                _validarCampos();
                                popupDeuErrado(context);
                                if (_mensagemErro != "")
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
                                else {

                                  Map<String,dynamic> produtos = {
                                    'name': _nomedogrupo.text,
                                    'qtd_produtos': _qtdProdutos.text,
                                    'ramo_escolhido': _productionSel,
                                    'image': ""
                                  };
                                  model.pegaNomedeumaFazenda();
                                  String idProduto = await model.criaProduto(produtos, _image, this._idFazenda);

                                  // Registra Item
                                  popup(context, idProduto);

                                }
                              },
                              child: Text(
                                "CADASTRAR NOVO TIPO",
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
        )
    );
  }
}