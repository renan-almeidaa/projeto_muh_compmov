import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/cadastro_fazenda_screen.dart';
import 'package:projeto_muh_compmov/screens/fazenda_selecionada_screen.dart';
import 'package:projeto_muh_compmov/screens/item_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {}


class FazendasScreen extends StatefulWidget {
  @override
  _FazendasScreen createState() => _FazendasScreen();
}

class _FazendasScreen extends State<FazendasScreen> {

  Future<void> refreshPage() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  popup(BuildContext context, String nome, String id) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Fazenda selecionada: " + nome),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            onPressed: () {
              Navigator.pop(context);
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
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FazendasScreen())
              );

            },
          )
        ],
      );
    });
  }

  Condicional(BuildContext context, UserModel model, String idFazenda) {
    // print("entrou no cont");
    // print("entrou no cont" + idFazenda.toString());
    model.pegaNomedosProdutos(idFazenda);
    // print("oiii");
    // if(model.condicional){
    //   print( "allloooooo" + model.condicional.toString());
    // } else {
    //   print( "allloooooo" + model.condicional.toString());
    // }
    if (model.condicional) {
      return new Column(
        children: <Widget>[
          Container(
            height: 410,
              child: new GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: List.generate(model.produtos.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.black),
                      ),
                      child: GestureDetector(
                        child: Center(
                          child: Text(
                            '${model.produtos[index]}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline,
                          ),
                        ),
                        onTap: (){
                          print("model: " + model.produtos[index]);
                          print("Id Fazenda: " + model.id[model.indice]);
                          print("Id Produto: " + model.produtosId[index]);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ItemScreen(model.id[model.indice], model.produtosId[index], idFazenda))
                          );
                        },
                      ),
                    );
                  })
              ),
            ),
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Container(
            height: 410,
            child: new GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: List.generate(0, (index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(3),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    child: GestureDetector(
                      child: Center(

                      ),
                      onTap: (){
                        print("model: " + model.produtos[index]);
                      },
                    ),
                  );
                })
            ),
          ),
        ],
      );

    }
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
            //model.produtos.clear();
            //model.nome.clear();
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
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
                        refreshPage();
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
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: Condicional(context, model, _productionSel),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1),
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
                Padding(
                  padding: EdgeInsets.all(1),
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CadastroFzd())
                      ).then((value) async {
                        model.pegaNomedeumaFazenda();
                        await Future.delayed(Duration(seconds: 1));
                        setState(() {});
                      });
                    },
                    child: Text(
                      "Adicionar Nova Fazenda",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                )
              ],
            );
          }
      ),
      drawer: CustomDrawer(this.name),
    );

  }

}