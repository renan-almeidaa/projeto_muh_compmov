import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/mensagens.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch(settings.name){
      case "/mensagens":
        return MaterialPageRoute(
          builder: (_) => Mensagens(args)
        );
    }
  }

}