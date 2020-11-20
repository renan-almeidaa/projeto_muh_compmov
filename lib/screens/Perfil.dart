import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/Feed.dart';
import 'package:projeto_muh_compmov/screens/Foto.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Destaque.dart';


class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
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

          body: ListView(
            children: [
              Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height/2.3,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                //color: Colors.red,
                                height: MediaQuery.of(context).size.height/5,
                                width: MediaQuery.of(context).size.width/3,
                                child: Stack(
                                  children: [
                                    Center(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.black, //coloca a imagem da pessoa, coloca background imagem
                                        )
                                    ),
                                    Center(
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 75),
                                            child: Container(
                                              height: 30,
                                              alignment: Alignment.bottomRight,
                                              child: FloatingActionButton(
                                                child: Icon(Icons.add),
                                                onPressed: (){},
                                              ),

                                            )
                                        )
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Column(
                                            children: [
                                              Text(
                                                model.imagem.length.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),

                                              ),
                                              Text(
                                                "Publicações",
                                                style: TextStyle(
                                                    fontSize: 15
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [

                                        Padding(
                                          padding:EdgeInsets.only(left: 8),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/3 - 16,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            child: RaisedButton(
                                              onPressed: (){},
                                              color: Colors.white,
                                              child: Text(
                                                "Editar perfil",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  model.nome_identificacao,// nome da pessoa
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Apaixonado por sorvete de flocos",// nome da pessoa
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Tenho alguns muitos hobbities, sendo o melhor o bilbo",// nome da pessoa
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 108,
                            //color: Colors.red,
                            child: Destaque(),

                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.1,
                      color: Colors.black,
                    ),

                      FeedPerfil(model),

                    ]
              ),
            ],
          ),

          drawer: CustomDrawer(),
          );
      }
    );
    }
  }