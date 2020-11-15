import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/IconTile.dart';
import 'package:projeto_muh_compmov/screens/cadastro_fazenda_screen.dart';
import 'package:projeto_muh_compmov/screens/help_screen.dart';


import 'package:projeto_muh_compmov/screens/help_screen.dart';
import 'package:projeto_muh_compmov/screens/login_screen.dart';class IconSectionDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: "Ajuda",
          iconData: Icons.help,
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HelpScreen())
            );
          },
          high: false,
        ),
        IconTile(
          label: "Sair",
          iconData: Icons.exit_to_app,
          onTap: (){

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginScreen())
            );
          },
          high: false,
        ),
      ],
    );
  }
}