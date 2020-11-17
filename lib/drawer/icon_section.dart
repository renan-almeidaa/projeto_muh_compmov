import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/IconTile.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/Perfil.dart';
import 'package:projeto_muh_compmov/screens/cadastro_fazenda_screen.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class IconSection extends StatefulWidget {

  //final List nome;
  IconSection();

  @override
  _IconSectionState createState() => _IconSectionState();
}

class _IconSectionState extends State<IconSection> {

  //final List nome;
  //_IconSectionState(this.nome);


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Perfil())
                    );
                  },
                  high: false,
                ),
                IconTile(
                  label: "Minha Fazenda",
                  iconData: Icons.landscape,
                  onTap: (){
                    print(model.nome.length);
                    if(model.nome.length == 0){
                      model.pegaNomedeumaFazenda();
                      model.produtos.clear();
                      model.condicional = false;
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
          );
        }
    );

  }
}