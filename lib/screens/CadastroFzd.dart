import 'package:flutter/material.dart';

void main(){



}
class CadastroFzd extends StatefulWidget {
  @override
  _CadastroFzdState createState() => _CadastroFzdState();
}

class _CadastroFzdState extends State<CadastroFzd> {
  //para o dropDown
List<String> _productions = ['Leite', 'hortaliças'];
String _productionSel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: new IconThemeData(color: Colors.black),
      //  leading: Image.asset("imagens/cow.png"),
      title: Image.asset("images/cow.jpg", alignment: Alignment.center, scale: 1.5, width: 50, height: 50,),
      actions: [
       RaisedButton(
        // color: Colors.white,
        //padding: EdgeInsets.only(0.2),
        child:
        Icon(Icons.message),
        color: Colors.white,
        onPressed: () {
         // vai para as mensagens...
        },
       ),
      ],
     ),
     body: Container(


        child: SingleChildScrollView(
        child: Column(


         children: <Widget>[
          Padding(
           padding: EdgeInsets.only(top: 25 ,bottom: 20),

         child: Text(
                  "Cadastro fazenda",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none
                ),
              ),
          ),
          Padding(

             padding: EdgeInsets.all(15),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Text(
                    "Nome da fazenda:",
                    style: TextStyle(
                     fontSize: 25,
                     fontStyle: FontStyle.normal,
                     fontWeight: FontWeight.bold,
                    ),
                   ),
                   Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                     keyboardType: TextInputType.name,
                     decoration: InputDecoration(
                         contentPadding: EdgeInsets.fromLTRB(15,15,15,15),
                         hintText: "Digite um nome",
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15)
                         )
                     ),

                    ),

                   ),

                  ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:<Widget>[
                     Text(
                       "Endereço:",
                       style: TextStyle(
                         fontSize: 25,
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(top: 5, bottom: 5),
                       child: TextField(
                         style: TextStyle(
                           fontSize: 17,
                         ),
                         keyboardType: TextInputType.streetAddress,
                         decoration: InputDecoration(
                             contentPadding: EdgeInsets.fromLTRB(15,15,15,15),
                             hintText: "Digite o endereço",
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(15)
                             )
                         ),

                       ),

                     ),

                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children:<Widget>[
                     Text(
                       "Produção primária:",
                       style: TextStyle(
                         fontSize: 25,
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(bottom: 20),
                       child: new Center(
                         child: DropdownButton(
                           icon: Icon(Icons.arrow_downward),
                           iconSize: 20,
                           elevation: 20,
                           style: TextStyle(color: Colors.black),
                           underline: Container(
                             height: 3,
                             color: Colors.black87,
                           ),
                           hint: Text('Selecione um tipo...'), // Not necessary for Option 1
                           value: _productionSel,
                           onChanged: (newValue) {
                             setState(() {
                               _productionSel = newValue;
                             });
                           },
                           items: _productions.map((location) {
                             return DropdownMenuItem(
                               child: new Text(location),
                               value: location,
                             );
                           }).toList(),
                         ),
                       ),
                     ),


                     ],
                     ),

                 Align(
                   alignment: Alignment.center,
                   child: FlatButton(
                       color: Colors.black,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                           side: BorderSide(color: Colors.black)
                       ),
                       onPressed: (){
                         //faz algo
                       },
                       child: Row(
                         mainAxisAlignment:  MainAxisAlignment.center,
                         children: <Widget>[
                         Text(
                         "Imagem",
                         style: TextStyle(
                           fontSize: 24,
                           color: Colors.white,
                           decoration: TextDecoration.none,

                         ),
                         ),
                           Icon(
                             Icons.image,
                             color: Colors.white,
                           )
                         ],
                       )
                   ),
                 ),

                 //dropdown
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Text(
                    "Descrição:",
                    style: TextStyle(
                     fontSize: 25,
                     fontStyle: FontStyle.normal,
                     fontWeight: FontWeight.bold,
                    ),
                   ),
                   Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                   child: TextField(
                     style: TextStyle(
                       fontSize: 17,
                     ),
                    keyboardType: TextInputType.multiline,

                    decoration: InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(5,60,0,60),
                        hintText: "Faça uma descrição da fazenda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),

                   ),
                   ),
                  ],

                 ),

             ],

             ),
          ),

       Align(

         child: FlatButton(
             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
             color: Colors.black,
             onPressed: (){
               //faz algo
             },
             child: Text(
               "Cadastrar fazenda",
               style: TextStyle(
                   fontSize: 35,
                   color: Colors.white,
                   decoration: TextDecoration.none,

               ),
             )
         )
       ),
    ],
   ),

      ),
    ),
    );









  }
}
