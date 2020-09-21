import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/fazenda_selecionada_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {}


class FazendasScreen extends StatefulWidget {
  @override
  _FazendasScreen createState() => _FazendasScreen();
}

class _FazendasScreen extends State<FazendasScreen> {
  popup(BuildContext context, String nome, String id) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Fazenda selecionada: " + nome),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FazendaSelecionadaScreen(nome, id))
              );
            },
          )
        ],
      );
    });
  }

  popupDeuErrado(BuildContext context, String nome, String id) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Escolha uma fazenda!"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FazendasScreen())
              );
            },
          )
        ],
      );
    });
  }


  //para o dropDown
  List<String> _productions = ['Leite', 'hortaliças'];
  String _productionSel;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _descriptionController =  TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String mensagem = "";
  List name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset(
          "assets/vakinha.png",
          alignment: Alignment.center,
          scale: 3.5,
        ),
        actions: [
          RaisedButton(
            // color: Colors.white,
            //padding: EdgeInsets.only(0.2),
            child: Icon(Icons.message),
            color: Colors.white,
            onPressed: () {
              // vai para as mensagens...
            },
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: new Center(
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 20,
                      elevation: 20,
                      style: TextStyle(color: Colors.black),

                      hint: Text(
                          'Selecione uma fazenda'), // Not necessary for Option 1
                      value: _productionSel,

                      onChanged: (newValue) {
                        setState(() {
                          _productionSel = newValue;
                        });
                      },
                      items: model.nome.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 410,
                      child: GestureDetector(
                        onTap: (){
                          print("clicado");
                        },
                        child: GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 2,
                            children: List.generate(10, (index){
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(3),
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    'Item $index',
                                    style: Theme.of(context).textTheme.headline,
                                  ),
                                ),
                              );
                            })
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: (){
                      if(_productionSel != null) {
                        popup(context, _productionSel, model.idFazenda);
                        this.name = model.nome;
                      } else {
                        popupDeuErrado(context, _productionSel, model.idFazenda);
                      }
                    },
                    child: Text(
                      "Adicionar Novo Produto",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
      drawer: CustomDrawer(this.name),
    );

  }
}