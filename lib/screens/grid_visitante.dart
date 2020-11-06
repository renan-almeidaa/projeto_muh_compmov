import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';
import 'package:projeto_muh_compmov/screens/feed_screen.dart';
import 'package:projeto_muh_compmov/screens/login_screen.dart';
import 'package:projeto_muh_compmov/screens/signup_screen.dart';

class GridVisitanteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10,30,10,10),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(opcoes.length, (index) {
              return Center(
                child: GestureDetector(
                    child: OpcaoCard(opcao: opcoes[index]),
                  onTap: (){
                    NavigatorScreen(index, context);
                  },
              )
              );
              },
          ),
        ),
      )

    )
    );
  }

  void NavigatorScreen(index, context){
      switch(index){
        case 0:
          //Navigator.of(context).push(
            //MaterialPageRoute(builder: (context) => T),
          //);
          break;
        case 1:
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FeedScreen()),
          );
          break;
        case 2:
         /* Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaPrincipal(this.name)),
          );

          */
          break;
        case 3:
          /*
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaPrincipal(this.name)),
          );

           */
          break;
        case 4:

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          );


          break;
        case 5:

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          break;
      }
  }

}
class Opcao {
  const Opcao({this.titulo, this.icon, this.tag});
  final String titulo;
  final IconData icon;
  final int tag;
}
const List<Opcao> opcoes = const <Opcao>[
  const Opcao(titulo: 'Fazenda', icon: Icons.home, tag: 0 ),
  const Opcao(titulo: 'Feed', icon: Icons.add_to_home_screen, tag: 1),
  const Opcao(titulo: 'Perfil', icon: Icons.person_outline, tag: 2),
  const Opcao(titulo: 'Buscar', icon: Icons.search, tag: 3),
  const Opcao(titulo: 'Cadastro', icon: Icons.person, tag: 4),
  const Opcao(titulo: 'Login', icon: Icons.account_circle, tag: 5),
];
class OpcaoCard extends StatelessWidget {
  const OpcaoCard({Key key, this.opcao}) : super(key: key);
  final Opcao opcao;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(opcao.icon, size: 80.0, color: textStyle.color),
                Text(opcao.titulo, style: textStyle),
              ]
          ),
        )
    );
  }
}