import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fazenda{

  String _nome ;
  String _endereco ;
  String _descricao ;
  String _id;

  Fazenda.fromDocument(DocumentSnapshot snapshot){
    _id = snapshot.documentID;
    _nome = snapshot.data['name'];
    _descricao = snapshot.data['description'];
    _endereco = snapshot.data['address'];
  }

  Map<String,dynamic> toResumedMap(){
    return{
      'id': _id,
      'nome': _nome,
      'description': _descricao,
      'endereco': _endereco
    };
  }

  String get descricao => _descricao;

  String get endereco => _endereco;

  String get nome => _nome;

  set descricao(String value) {
    _descricao = value;
  }

  set endereco(String value) {
    _endereco = value;
  }

  set nome(String value) {
    _nome = value;
  }
}