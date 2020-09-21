import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/IconTile.dart';
import 'package:projeto_muh_compmov/screens/CadastroFzd.dart';


class IconSectionDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: "Ajuda",
          iconData: Icons.help,
          onTap: (){

          },
          high: false,
        ),
        IconTile(
          label: "Sair",
          iconData: Icons.exit_to_app,
          onTap: (){

          },
          high: false,
        ),
      ],
    );
  }
}