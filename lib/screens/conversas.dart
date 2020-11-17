import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/Conversa.dart';
import 'package:projeto_muh_compmov/screens/mensagens.dart';

class Conversas extends StatelessWidget {
  List _nome = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Conversas"),
      ),
      body: CustomForm(_nome),
      drawer: CustomDrawer(),
    );
  }
}

// -- FORM
class CustomForm extends StatefulWidget {

  List _nome;

  CustomForm(List nome) {
    this._nome = nome;
  }
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  List<Conversa> listaConversas = [
    Conversa(
      "Gustavo",
      "Tranquilão",
      "https://scontent.fldb2-2.fna.fbcdn.net/v/t1.0-9/70736322_2365254756915559_5117522647797727232_o.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeH8bU2oWfxlHpa3qaKM3NRxyYBwZtYbkoDJgHBm1huSgGqOmxFvAht-v6hePPwUoW30QYEifsA2mIcH_v8l1pwg&_nc_ohc=Y0u5B5L0JMwAX8uSyWz&_nc_ht=scontent.fldb2-2.fna&oh=5a9fa21b672785b67c4665397d2af22c&oe=5FD6B55C"
    ),

    Conversa(
        "Eduardo",
        "Tranquilão",
        "https://scontent.fldb2-1.fna.fbcdn.net/v/t31.0-8/15578156_1032891483499634_1532209408217454666_o.jpg?_nc_cat=110&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeHSCtIKxmJZZZOxy6fdlCCDuuuWUzIyl6m665ZTMjKXqQTnzDdKpe-Guj9CLJ3wG114nI19zTljL7l7pxoPHdKT&_nc_ohc=mJ9apExWtmMAX9iHdeo&_nc_oc=AQkLfLJBLAt-qAy5SHjLIZrGwk0Q0mwJcN7iVkO-HdRzA9XPWl5qptCBTIYxk6CV8JK1qg_viu-Eda5SdZOEDfzA&_nc_ht=scontent.fldb2-1.fna&oh=b6068d922583c67b864587a948dc1515&oe=5FD70AC2"
    )
  ];

  @override
  Widget build(BuildContext context) {



      return ListView.builder(
          itemCount: listaConversas.length,
          itemBuilder: (context, indice) {
              Conversa conversa = listaConversas[indice];

              return ListTile(
                onTap: (){
                  Navigator.pushNamed(
                      context,
                      "/mensagens",
                      arguments: conversa
                  );
                },
                contentPadding: EdgeInsets.fromLTRB(16,8,16,8),
                leading: CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage( conversa.urlFoto),
                ),
                title: Text(
                  conversa.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),

                ),
                subtitle: Text(
                conversa.mensagem,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              );

          }
      );
  }

}