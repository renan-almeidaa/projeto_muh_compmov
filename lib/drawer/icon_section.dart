import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/IconTile.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/CadastroFzd.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class IconSection extends StatefulWidget {

  final List nome;
  IconSection(this.nome);

  @override
  _IconSectionState createState() => _IconSectionState(this.nome);
}

class _IconSectionState extends State<IconSection> {

  final List nome;
  _IconSectionState(this.nome);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          IconTile(
            label: "Inicio",
            iconData: Icons.home,
            onTap: (){
            },
            high: false,
          ),
          IconTile(
            label: "Perfil",
            iconData: Icons.person,
            onTap: (){
            },
            high: false,
          ),
          IconTile(
            label: "Minha Fazenda",
            iconData: Icons.landscape,
            onTap: (){
              if(this.nome.length == 0){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CadastroFzd())
                );
              }else{
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FazendasScreen())
                );
              }
            },
            high: false,
          ),
          IconTile(
            label: "Buscar",
            iconData: Icons.search,
            onTap: (){
            },
            high: false,
          ),
          IconTile(
            label: "Dashboard",
            iconData: Icons.assignment,
            onTap: (){
            },
            high: false,
          ),
        ]
    );;
  }
}