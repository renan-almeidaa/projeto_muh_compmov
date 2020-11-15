import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/models/Conversa.dart';

class Mensagens extends StatefulWidget {
  Conversa conversa;

  Mensagens(this.conversa);

  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  List<String> listaMensagens= [
    "Oi tudo bem",
    "Tudo sim e vc",
    "Tranquilão"
  ];
  TextEditingController _controllerMensagem = TextEditingController();

  _enviarMensagem(){
    String textoMensagem = _controllerMensagem.text;
    if(textoMensagem.isNotEmpty) {

    }
  }

  @override
  Widget build(BuildContext context) {

    var caixaMensagem = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMensagem,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                    hintText: "Digite uma mensagem...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff000000),
            child: Icon(Icons.send, color: Colors.white),
            mini: true,
            onPressed: _enviarMensagem,
          )
        ]
      ),
    );

    var listView = Expanded(
      child: ListView.builder(
        itemCount: listaMensagens.length,
        itemBuilder: (context, indice){
          //Define cores e alinhamentos
          Alignment alinhamento = Alignment.centerRight;
          Color cor = Color(0xff000000);
          Color corFonte = Colors.white;
          if( indice % 2 == 0 ){//par
            alinhamento = Alignment.centerLeft;
            cor = Colors.white;
            corFonte = Colors.black;
          }
          return Align(
            alignment: alinhamento,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Container(
                  padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cor,
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Text(
                    listaMensagens[indice],
                  style: TextStyle(
                      fontSize: 20,
                      color: corFonte
                  )
                )
              )
            ),
          );

        }
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Row (
            children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: CircleAvatar(
              maxRadius: 23,
              backgroundColor: Colors.grey,
              backgroundImage: widget.conversa.urlFoto != null ? NetworkImage(widget.conversa.urlFoto) : null),
            ),
          Text(widget.conversa.nome)
        ]),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundoChat.png"),
            fit: BoxFit.cover
          )
        ) ,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                listView,
                caixaMensagem,
              ]
            )
          )
        )
      ),
    );
  }
}
