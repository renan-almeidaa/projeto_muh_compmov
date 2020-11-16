import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/screens/Fot.dart';


class Foto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        height: MediaQuery.of(context).size.width/3 - 3,
        width: MediaQuery.of(context).size.width/3 - 3,
        child: Fot(),
      ),
    );
  }
}
