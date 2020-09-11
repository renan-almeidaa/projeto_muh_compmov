import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {}

class CadastroFzd extends StatefulWidget {
  @override
  _CadastroFzdState createState() => _CadastroFzdState();
}

class _CadastroFzdState extends State<CadastroFzd> {
  //para o dropDown
  List<String> _productions = ['Leite', 'hortaliças'];
  String _productionSel;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _descriptionController =  TextEditingController();
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
    //Recupera dados dos campos
    String nome = _nameController.text;
    String endereco = _adressController.text;

    List<String> producoes = _productions;
    String produtoSelecionado = _productionSel;
    if (nome.isNotEmpty) {
      if (endereco.isNotEmpty) {
        if (producoes.contains(produtoSelecionado)) {
          setState(() {
            _mensagemErro = "";
          });
        } else {
          setState(() {
            _mensagemErro = "Selecione o produto primário da sua fazenda!";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o endereço";
        });
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
          backgroundColor: Color(0xFF121416),
          // backgroundColor: Colors.black87,
          iconTheme: new IconThemeData(color: Colors.black),
          //  leading: Image.asset("imagens/cow.png"),
          title: Image.asset(
            "assets/cow.png",
            alignment: Alignment.center,
            scale: 10,
          ),
          leading: RaisedButton(
            color: Color(0xFF121416),
            // color: Colors.black12,
            child: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            RaisedButton(
              // color: Colors.white,
              //padding: EdgeInsets.only(0.2),
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              color: Color(0xFF121416),
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
                        child: Text(
                          "Cadastro fazenda",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Nome da fazenda:",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: TextFormField(
                                    controller: _nameController,
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 15, 15, 15),
                                        hintText: "Digite um nome",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Endereço:",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: TextField(
                                    controller: _adressController,
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(15, 15, 15, 15),
                                        hintText: "Digite o endereço",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Produção primária:",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
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

                                      hint: Text(
                                          'Selecione um tipo...'), // Not necessary for Option 1
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
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Imagem:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    RaisedButton.icon(
                                      onPressed: () {
                                        pickImageFromGallery(
                                            ImageSource.gallery);
                                      },
                                      icon: Icon(
                                        Icons.save_alt,
                                        size: 20,
                                      ),
                                      label: Text(
                                        "Carregar",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      elevation: 0,
                                      // color: Colors.white,
                                      color: Color(0xFFF4F5F6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(10, 10)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //dropdown
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Descrição:",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Container(
                                    child: TextField(
                                      controller: _descriptionController,
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      minLines: 3,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText:
                                              "Faça uma descrição da fazenda",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  ),
                                ),
                              ],
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
                                  Map<String,dynamic> farmData = {
                                    'name': _nameController.text,
                                    'address': _adressController.text,
                                    'productionPrimary': _productionSel,
                                    'description': _descriptionController.text,
                                    'image': ""
                                  };
                                  model.createFarmData(farmData, _image);
                                }
                              },
                              child: Text(
                                "Cadastrar fazenda",
                                style: TextStyle(
                                  fontSize: 35,
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
        ));
  }
}
