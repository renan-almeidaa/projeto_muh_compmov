import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/drawer/IconSectionDown.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'CustomHeader.dart';
import 'icon_section.dart';


class CustomDrawer extends StatefulWidget {

  final List nome;

  CustomDrawer(this.nome);

  @override
  _CustomDrawerState createState() => _CustomDrawerState(this.nome);
}

class _CustomDrawerState extends State<CustomDrawer> {

  final List nome;
  _CustomDrawerState(this.nome);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomHeader(),
          IconSection(this.nome),
          Divider(color: Colors.grey[500],),
          IconSectionDown(),
        ],
      ),
    );
  }
}