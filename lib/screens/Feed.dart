import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/Foto.dart';



class FeedPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Wrap(
              children: [
                Foto(),
                Foto(),
                Foto(),
                Foto(),
                Foto(),
                Foto(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
