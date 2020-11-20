import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/models/Conversa.dart';
import 'package:projeto_muh_compmov/models/Mensagem.dart';
import 'package:projeto_muh_compmov/models/Usuario.dart';

class Mensagens extends StatefulWidget {
  Usuario usuarioDestino;

  Mensagens(this.usuarioDestino);

  @override
  _MensagensState createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {

  String _idUsuarioLogado;
  String _idUsuarioDestinatario;
  Firestore db = Firestore.instance;


  List<String> listaMensagens= [
    "Oi tudo bem",
    "Tudo sim e vc",
    "Tranquilão"
  ];
  TextEditingController _controllerMensagem = TextEditingController();

  _enviarMensagem(){
    String textoMensagem = _controllerMensagem.text;
    if(textoMensagem.isNotEmpty) {

      Mensagem mensagem = Mensagem();
      mensagem.idUsuario = _idUsuarioLogado;
      mensagem.mensagem = textoMensagem;

      //Salvar mensagem para remetente
      _salvarMensagem(_idUsuarioLogado, _idUsuarioDestinatario, mensagem);

      //Salvar mensagem para o destinatário
      _salvarMensagem(_idUsuarioDestinatario, _idUsuarioLogado, mensagem);

      //Salvar conversa
      _salvarConversa(mensagem);
    }
  }

  _salvarConversa(Mensagem msg){
    //Salvar conversa remetente
    Conversa cRemetente = Conversa();
    cRemetente.idRemetente = _idUsuarioLogado;
    cRemetente.idDestinatario = _idUsuarioDestinatario;
    cRemetente.nome = widget.usuarioDestino.nome;
    cRemetente.mensagem = msg.mensagem;
    cRemetente.caminhoFoto =  widget.usuarioDestino.urlImagem;
    cRemetente.salvar();
    //Salvar conversa remetente
    Conversa cDestinatario = Conversa();
    cDestinatario.idRemetente = _idUsuarioDestinatario;
    cDestinatario.idDestinatario = _idUsuarioLogado;
    cDestinatario.nome = widget.usuarioDestino.nome;
    cDestinatario.mensagem = msg.mensagem;
    cDestinatario.caminhoFoto = widget.usuarioDestino.urlImagem;
    cDestinatario.salvar();
  }

  _salvarMensagem(String idRemetente, String idDestinatario, Mensagem msg) async {

    await db.collection("mensagens")
        .document(idRemetente)
        .collection(idDestinatario)
        .add(msg.toMap());
        _controllerMensagem.clear();
  }
 _recuperarDadosUsuario() async {
   FirebaseAuth auth = FirebaseAuth.instance;
   FirebaseUser usuarioLogado = await auth.currentUser();
   _idUsuarioLogado = usuarioLogado.uid;
   _idUsuarioDestinatario = widget.usuarioDestino.idUsuario;


 }

 @override
  void initState() {
    super.initState();
      _recuperarDadosUsuario();
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

    var stream = StreamBuilder(
      stream: db.collection("mensagens")
          .document(_idUsuarioLogado)
          .collection(_idUsuarioDestinatario).snapshots(),
      // ignore: missing_return
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
         return Center(
            child: Column(
              children: <Widget>[
                Text("Carregando mensagens"),
                CircularProgressIndicator()
              ],
            ),
          );
          break;
          case ConnectionState.active:
          case ConnectionState.done:
            QuerySnapshot querySnapshot = snapshot.data;

            if(snapshot.hasError){
              return Expanded(
                child: Text("Ero ao carregar os dados")
              );
              } else if(snapshot.hasData==false) {
              return Expanded(
                  child: Text("Comece uma conversa :)")
              );
            } else {
              return Expanded(
                  child: ListView.builder(
                      itemCount: querySnapshot.documents.length,
                      itemBuilder: (context, indice){

                        //recupera mensagem
                        List<DocumentSnapshot> mensagens = querySnapshot.documents.toList();
                        DocumentSnapshot item = mensagens[indice];

                        //Define cores e alinhamentos
                        Alignment alinhamento = Alignment.centerRight;
                        Color cor = Color(0xff000000);
                        Color corFonte = Colors.white;
                        if( _idUsuarioLogado != item["idUsuario"] ){//par
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
                                      item["mensagem"],
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
            }
        }
      }
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
              backgroundImage: widget.usuarioDestino.urlImagem != null ? NetworkImage(widget.usuarioDestino.urlImagem) : null),
            ),
          Text(widget.usuarioDestino.nome)
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
                stream,
                caixaMensagem,
              ]
            )
          )
        )
      ),
    );
  }
}
