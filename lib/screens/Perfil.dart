import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/screens/Feed.dart';

import 'Destaque.dart';


class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black
                      ),
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Gustavo Gatti Alves",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ), //Aqui muda o nome da pessoa
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: (){},
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: Icon(Icons.dehaze),
                          onPressed: (){},
                          iconSize: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                        " visita ao perfil nos ultimos 7 dias"
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 0.1,
                color: Colors.black,
              ), Container(
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
                                          "44",
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
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        Text(
                                          "44",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          ),

                                        ),
                                        Text(
                                          "Seguindo",
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        Text(
                                          "44",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          ),

                                        ),
                                        Text(
                                          "Seguidores",
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
                                          "Promover",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                            "Gustavo Gatti Alves",// nome da pessoa
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
              FeedPerfil(),
            ],
          ),
        ],
      ),
      );
    }
  }