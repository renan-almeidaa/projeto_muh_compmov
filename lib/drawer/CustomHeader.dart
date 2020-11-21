import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Container(
            height: 115,
            padding: const EdgeInsets.only(left:40),
            color: Colors.black,
            child: Row(
              children: <Widget>[
               // Icon(
                 // Icons.person,
                  //color: Colors.white,
                  //size: 30,
                //),
                Center(
                  child : new Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                (model.background_image == null ? "" : model.background_image))//AQUI GU VC SÓ PRECISA POR O LINK DA IMAGEM AQUI QUE VOCE UPOR PARA O FIREBASE
                        )
                    ),
                  ),
                ),

                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        model.nome_identificacao,//Nome
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        model.email,//Email
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        );


  }


}