import 'package:flutter/material.dart';

class FazendasScreen extends StatefulWidget {
  @override
  _FazendasScreenState createState() => _FazendasScreenState();
}

class _FazendasScreenState extends State<FazendasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Text("Alo Muh"),//Image.asset("imagens/cow.png", alignment: Alignment.center, scale: 1.5,),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 410,
              //colocar container do grid view dentro de gestDetector
              child: GestureDetector(
                onTap: (){
                  print("clicado");
                },
                child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
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
            ),
            Padding(
              padding: EdgeInsets.all(100),
              child: RaisedButton(

                color: Colors.black,
                onPressed: (){
                  print("clicar no botao");
                },
                child: Text(
                  "Adicionar Nova Tag",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)
                ),
              ),
            )
          ],
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
