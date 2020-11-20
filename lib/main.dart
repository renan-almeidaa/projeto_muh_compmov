import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/RouteGenerator.dart';
import 'package:projeto_muh_compmov/screens/Pub.dart';
import 'package:projeto_muh_compmov/screens/Publications.dart';
import 'package:projeto_muh_compmov/screens/cadastro_fazenda_screen.dart';
import 'package:projeto_muh_compmov/screens/TelaPrincipalEntrada.dart';
import 'package:projeto_muh_compmov/screens/conversas.dart';
import 'package:projeto_muh_compmov/screens/fazenda_selecionada_screen.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';

import 'package:projeto_muh_compmov/screens/help_screen.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:projeto_muh_compmov/screens/login_screen.dart';
import 'package:projeto_muh_compmov/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';

void main() {


  runApp(MyApp());
  Firestore.instance.collection('tes').document('doc').setData({'nome':'eduardo'});


}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'Muh',
          theme: ThemeData(
              primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 0, 0, 0)
        ),
          onGenerateRoute: RouteGenerator.generateRoute,
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        )

    );
  }
}
