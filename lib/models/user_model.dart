import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/firebase/Fazenda.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{

  FirebaseAuth _auth = FirebaseAuth.instance;
  List nome = [];
  List produtos = [];
  String idFazenda;
  FirebaseUser firebaseUser;
  Map<String,dynamic> userData = Map();
  List id = [];

  bool condicional = false;


  bool isLoading = false;

  static UserModel of(BuildContext context)=>
      ScopedModel.of<UserModel>(context);


  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
  }

  void signUp({@required Map<String,dynamic> userData,@required String pass,
    @required VoidCallback onSuccess,@required VoidCallback onFail}){
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: userData['email'],
        password: pass
    ).then((value) async {
      firebaseUser = value;
      await _saveUserData(userData);
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((onError){
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn({@required String email,@required String pass,
    @required VoidCallback onSuccess,@required VoidCallback onFail})async{
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
    _auth.signInWithEmailAndPassword(email: email, password: pass).then((value) async {

      firebaseUser = value;
      await _loadCurrentUser();
      onSuccess();
      isLoading = false;
      notifyListeners();

    }).catchError((onError){

      onFail();
      isLoading = false;
      notifyListeners();

    });
  }

  void recoverPass(String email){
    _auth.sendPasswordResetEmail(email: email);
  }

  Future<Null> _saveUserData(Map<String,dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection('users').document(firebaseUser.uid).setData(userData);
  }

  Future<String> _updateImage(File image) async {
    if (image != null) {
      StorageUploadTask task = FirebaseStorage.instance.ref().child(
          DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()
      ).putFile(image);
      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      return url;
    }
    return "";
  }

  Future<Null> createProdutoData(Map<String,dynamic> farmData, String idFarm) async {
    // String url = await _updateImage(image);
    //farmData.update('image', (value) => value = url);
    await Firestore.instance.collection('users').document(firebaseUser.uid).collection("farms").document(idFarm).collection("products").document().setData(farmData);
  }

  Future<Null> createFarmData(Map<String,dynamic> farmData, File image) async {
    String url = await _updateImage(image);
    farmData.update('image', (value) => value = url);
    await Firestore.instance.collection('users').document(firebaseUser.uid).collection("farms").document().setData(farmData);
  }

  Future<String> pegaItensdeumaFazenda() async{ // retorna os itens da fazenda da tela do gu
    DocumentSnapshot fazenda = await Firestore.instance.collection('users').document(firebaseUser.uid).collection('farms').document().get();
    String nome = fazenda.data['name'];
    return nome;
  }

  Future<Null> criarTipo(String idFarm, Map<String,dynamic> idtag,  File image) async {
    await Firestore.instance.collection('users').document(firebaseUser.uid).collection("farms").document(idFarm).collection("products").document().setData(idtag);
  }

  Future<Null> criaProduto(Map<String, dynamic> produtos, File image, String id_fazenda) async {
    String url = await _updateImage(image);
    produtos.update('image', (value) => value = url);
    await Firestore.instance.collection('users').document(firebaseUser.uid).collection("farms").document(id_fazenda).collection('products').document().setData(produtos);
  }

  Future<List> pegaNomedeumaFazenda() async{ // retorna os itens da fazenda da tela do gu
    QuerySnapshot query = await Firestore.instance.collection('users').document(firebaseUser.uid).collection('farms').getDocuments();
    for(DocumentSnapshot item in query.documents) {
      var dados = item.data;
      print("nome12121212121: " + dados["name"]);
      String aux = dados["name"];
      nome.add(aux);
      id.add(item.documentID);
      print("\n\n\n\n\n dados: " + item.documentID);
      idFazenda = item.documentID;
    }
  }

  int RetornaIndiceProduto(String NomeFazenda){
    print("chegou aqui" + NomeFazenda);
    print("chegou aqui" + this.nome.length.toString());
    int indice = 0;
    for(int i=0; i<this.nome.length;i++){
      if(this.nome[i].toString() == NomeFazenda){
        print("Nome da fazenda:" + this.nome[i]);
        print("Id da fazenda:" + this.id[i]);
        indice = i;
        break;
      }
    }
    return indice;
  }

  Future<Null> pegaNomedosProdutos(String idFazenda) async{ // retorna os itens da fazenda da tela do gu


    int indice = RetornaIndiceProduto(idFazenda);
    String idFa = this.id[indice];


    QuerySnapshot query = await Firestore.instance.collection('users').document(firebaseUser.uid).collection('farms').document(idFa).collection('products').getDocuments();
    for(DocumentSnapshot item in query.documents) {
      var dados = item.data;
      print("nome12121212121: " + dados["name"]);
      String aux = dados["name"];
      produtos.add(aux);
      print("\n\n\n\n\n dados: " + item.documentID);
      //idFazenda = item.documentID;
    }
    if(produtos.isEmpty){
      print("N tem gente aqui");
      this.condicional = false;
    }else{
      this.condicional = true;
      print("tem gente aqui");
    }

  }

  Future<Null> createItemData(Map<String,dynamic> itemData, File image, String farmId, String IdProduto) async {
    String url = await _updateImage(image);
    itemData.update('image', (value) => value = url);
    //await Firestore.instance.collection('users').document(firebaseUser.uid).collection('farms').document(farmId).collection('items').document().setData(itemData)
    //await Firestore.instance.collection('users').document(firebaseUser.uid).collection("farms").document(farmId).collection('items').document().setData(itemData);
   await Firestore.instance.collection('users').document(firebaseUser.uid).collection("farms").document(farmId).collection("produtos").document(IdProduto).collection("items").document().setData(itemData);
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  void SignOut() async{
    await _auth.signOut();
    userData=Map();
    firebaseUser=null;
    notifyListeners();
  }
  Future<Null> _loadCurrentUser() async{
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
      if(userData['name'] == null){
        DocumentSnapshot docUser =
        await Firestore.instance.collection('users').document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }
    notifyListeners();
  }
}