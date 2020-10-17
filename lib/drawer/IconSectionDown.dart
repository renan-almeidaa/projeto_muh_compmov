import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/IconTile.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/CadastroFzd.dart';
import 'package:projeto_muh_compmov/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';


class IconSectionDown extends StatelessWidget {

  popupDeuErrado(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      print("teste");
      return AlertDialog(
        title: Text("Saindo"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen())
              );
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
   return ScopedModelDescendant<UserModel>(
       builder: (context, child, model){
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
                  model.SignOut();
                  popupDeuErrado(context);
               },
               high: false,
             ),
           ],
         );
       }
   );
  }
}