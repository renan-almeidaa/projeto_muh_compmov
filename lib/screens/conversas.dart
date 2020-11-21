import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/Conversa.dart';
import 'package:projeto_muh_compmov/models/Usuario.dart';
import 'package:projeto_muh_compmov/screens/mensagens.dart';

class Conversas extends StatelessWidget {
  List _nome = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Conversas"),
      ),
      body: CustomForm(_nome),
      drawer: CustomDrawer(),
    );
  }
}

// -- FORM
class CustomForm extends StatefulWidget {

  List _nome;

  CustomForm(List nome) {
    this._nome = nome;
  }
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  List<Conversa> _listaConversas = List();
  final _controller = StreamController<QuerySnapshot>.broadcast();
  Firestore db = Firestore.instance;
  String _idUsuarioLogado;

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();

    Conversa conversa = Conversa();
    conversa.nome = "Ana Clara";
    conversa.mensagem = "Olá tudo bem?";
    conversa.caminhoFoto = "https://miro.medium.com/max/900/1*zycFEuGuh48dSDoUaOwnuA.jpeg";

    _listaConversas.add(conversa);

  }

  Stream<QuerySnapshot> _adicionarListenerConversas(){

    final stream = db.collection("conversas")
        .document( _idUsuarioLogado )
        .collection("ultima_conversa")
        .snapshots();

    stream.listen((dados){
      _controller.add( dados );
    });

  }

  _recuperarDadosUsuario() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuarioLogado = usuarioLogado.uid;

    _adicionarListenerConversas();

  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: _controller.stream,
      // ignore: missing_return
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: <Widget>[
                  Text("Carregando conversas"),
                  CircularProgressIndicator()
                ],
              ),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text("Erro ao carregar os dados!");
            }else{

              QuerySnapshot querySnapshot = snapshot.data;

              if( querySnapshot.documents.length == 0 ){
                return Center(
                  child: Text(
                    "Você não tem nenhuma mensagem ainda :( ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                );
              }

              return ListView.builder(
                  itemCount: querySnapshot.documents.toList().length,
                  itemBuilder: (context, indice){
                    List<DocumentSnapshot> conversas = querySnapshot.documents.toList();
                    DocumentSnapshot item = conversas[indice];

                    String urlImagem  = item["caminhoFoto"];
                    String nome = item["nome"];
                    String mensagem = item["mensagem"];
                    String idDestinatario = item["idDestinatario"];

                    Usuario usuario = Usuario();
                    usuario.nome = nome;
                    usuario.urlImagem = urlImagem;
                    usuario.idUsuario = idDestinatario;

                    return ListTile(
                        onTap: (){
                          Navigator.pushNamed(
                              context,
                              "/mensagens",
                              arguments: usuario
                          );
                        },
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.grey,
                          backgroundImage: urlImagem!=null
                              ? NetworkImage( urlImagem )
                              : null,
                        ),
                        title: Text(
                          nome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        subtitle: Text(
                            mensagem,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                            )
                        )

                    );

                  }
              );

            }
        }
      },
    );


  }

}