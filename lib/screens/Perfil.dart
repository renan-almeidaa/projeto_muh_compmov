import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/models/Mensagem.dart';
import 'package:projeto_muh_compmov/models/Usuario.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/Feed.dart';
import 'package:projeto_muh_compmov/screens/Foto.dart';
import 'package:projeto_muh_compmov/screens/Publications.dart';
import 'package:projeto_muh_compmov/screens/mensagens.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Destaque.dart';

class Perfil  extends StatefulWidget {

  final String _background_imagem;

  Perfil(this._background_imagem);

  @override
  _Perfil createState() => _Perfil(_background_imagem);

}


class _Perfil extends State<Perfil> {

  final String _background_imagem;

  _Perfil(this._background_imagem);

  String nova_imagem;

  File _image;
  String _filename = '';


  String getFileName(File file) {
    return basename(file.path);
  }

  pickImageFromGallery(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final PickedFile image = await picker.getImage(source: source);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Image.asset(
              "assets/vakinha.png",
              alignment: Alignment.center,
              scale: 3.5,
            ),
            
          ),

          body:
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
                                          backgroundImage: NetworkImage(model.background_image), //coloca a imagem da pessoa, coloca background imagem
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
                                                onPressed: () async {
                                                  await pickImageFromGallery(ImageSource.gallery);
                                                  setState(() {
                                                    _filename = getFileName(_image);
                                                  });
                                                    model.AddImagemUser(_image);
                                                    setState(() {
                                                      model.background_image = model.background_image;
                                                    });
                                                },
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
                                              onPressed: (){


                                                Navigator.of(context).push(

                                                    MaterialPageRoute(builder: (context) => Mensagens(new Usuario())),
                                                );
                                              },
                                              color: Colors.white,
                                              child: Text(
                                                "Mensagem",
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
                    Expanded(child: SizedBox(
                      height: 20,
                      child: Wrap(
                        children: [
                          Expanded(
                              child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                                child: GridView.count(
                                  scrollDirection: Axis.vertical,
                                  crossAxisCount: 3,
                                  children: List.generate(model.preco.length, (index) {
                                    return GestureDetector(
                                      onTap: (){
                                        print("Imagem: " + model.imagem[index]);
                                        print("Preco: " + model.preco[index]);
                                        print("Descricao: " + model.descricao[index]);
                                        //data
                                        //nome da pessoa
                                        //imagem_perfil
                                        /*
                                        final String _img;
                                        final String desc;
                                        final String preco;
                                        final String nome;
                                        final String data;
                                        final String img_perfil;
                                        */
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => Publications(model.imagem[index], model.descricao[index], model.preco[index], model.nome_identificacao, model.datas[index], model.background_image))
                                        );

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Container(
                                          //color: Colors.indigo,
                                          height: MediaQuery.of(context).size.width/3 - 3,
                                          width: MediaQuery.of(context).size.width/3 - 3,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        model.imagem[index]
                                                    ),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                          )
                      )
                          )
                        ],
                      ),
                      ))
                    ]
              ),

          drawer: CustomDrawer(),
          );
      }
    );
    }



}