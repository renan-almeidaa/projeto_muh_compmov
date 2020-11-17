import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/Pub.dart';

class Destaque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 15),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              child: Column(
                children: [
                  CircleAvatar(radius: 30,
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, size: 35, color: Colors.black),

                    ),
                    backgroundColor: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(
                      width: 60,
                      child: Flexible(
                        child: Center(
                          child: Text(
                            "Publicar",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Pub())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}