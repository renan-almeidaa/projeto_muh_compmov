import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/fazenda_selecionada_screen.dart';

class FazendasScreen extends StatefulWidget {
  @override
  _FazendasScreenState createState() => _FazendasScreenState();
}

class _FazendasScreenState extends State<FazendasScreen> {
  List<String> _fazendas = ['Santa Julia', 'São João', 'Fazenda Bom Jesus'];
  String _selecionada;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                icon: Icon(Icons.arrow_downward),
                iconSize: 20,
                elevation: 20,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,

                ),
                hint: Text("Selecione uma das fazendas cadastradas", textAlign: TextAlign.center),
                underline: Container(
                  height: 3,
                  color: Colors.black87,
                ),
                value: _selecionada,
                onChanged: (newValue){
                  _selecionada = newValue;
                  setState(() {
                    _selecionada = newValue;
                  });
                },
                items: _fazendas.map((fazenda)  {
                  return DropdownMenuItem(
                    child: new Text(fazenda),
                    value: fazenda,
                  );
                }).toList(),
              ),
              Container(
                height: 370,
                child: GestureDetector(
                  onTap: (){
                    print("Clicado");
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
                    }),
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FazendaSelecionadaScreen(_selecionada)),
                    );
                  },
                  child: Text(
                    "Adicionar Novo Produto",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ],
          ),
        ),
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