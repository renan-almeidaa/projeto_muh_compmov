import 'package:flutter/material.dart';

class FazendaSelecionadaScreen extends StatefulWidget {
  @override
  _FazendaSelecionadaScreenState createState() => _FazendaSelecionadaScreenState();
}

class _FazendaSelecionadaScreenState extends State<FazendaSelecionadaScreen> {

  List<String> _locations = ['Produto', 'Hortaliças']; // Option 2
  String _selectedLocation; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset("imagens/cow.png", alignment: Alignment.center, scale: 1.5,),
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
      body: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child:
                      Text("Fazenda 1", style: TextStyle(fontFamily: 'Raleway', package: 'my_package',fontSize: 50, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic)),

                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        color: Colors.white,
                        child: TextField(
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
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
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

                    /* Padding(
                       padding: EdgeInsets.only(bottom: 0, left:0),
                       child: RaisedButton(
                         color: Colors.white,
                         padding: EdgeInsets.all(1),
                         child: Row(
                           mainAxisSize: MainAxisSize.max,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.all(4.0),
                               child: Icon(
                                 Icons.file_upload,
                                 color: Colors.black,
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(2.0),
                               child: Text(
                                 "Adicionar uma imagem...",
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         onPressed: () {
                           //chama outra funcao
                         },
                     ),
                     ), */
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
                                // adiciona um novo item...
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
                          print("Botao!");
                        },
                      ),
                    )
                  ]
              ),
            ),
          )
      ),

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
      ),
    );
  }
}
