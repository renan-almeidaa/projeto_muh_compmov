import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:projeto_muh_compmov/feed/FeedImageContent.dart';
import 'package:projeto_muh_compmov/feed/FeedTextContent.dart';
import 'package:projeto_muh_compmov/feed/ifeed.dart';
import 'package:projeto_muh_compmov/models/Usuario.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/mensagens.dart';
import 'package:scoped_model/scoped_model.dart';

class Feed extends StatefulWidget {

  // UserInfo: userId, userName, userImage
  // PubInfo: pubId, pubDesc, pubDate, pubImage

  final Map<String, String> _userInfo;
  final Map<String, String> _pubInfo;

  Map<String, String> get userInfo => this._userInfo;
  Map<String, String> get pubInfo => this._pubInfo;

  Feed({@required userInfo, @required pubInfo})
      : this._userInfo = userInfo, this._pubInfo = pubInfo;

  @override
  _FeedState createState() => _FeedState();

}

class _FeedState extends State<Feed> implements IFeed {

  bool _favState = false; // Informação se o usuário favoritou a publicação
  bool _likeState = false; // Informação se o usuário curtiu a publicação

  @override
  void initState() {
    super.initState();
    UserModel model = ScopedModel.of(context);
    this._getLikeState(model, widget._pubInfo).then((value) {
      setState(() {
        this._likeState = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            render(),
            renderContent(),
            renderBottom(),
          ]
      ),
    );
  }

  @override
  Widget render() {
    return ListTile(
      onTap: null, // Vai pro perfil
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: (widget._userInfo["userImage"] == null ? AssetImage("assets/person-icon.png") : NetworkImage(widget._userInfo["userImage"]))
          )
        ),
      ),
      title: Text(widget._userInfo["userName"]),
      subtitle: Text("Enviado em ${DateFormat("dd/MM/yyyy").format(DateTime.parse(widget._pubInfo["pubDate"]))}"),
    );
  }

  @override
  Widget renderContent() {
    if(widget._pubInfo["pubImage"] != null && widget._pubInfo["pubImage"].isNotEmpty) {
      return FeedImageContent(
        description: widget._pubInfo["pubDesc"],
        imageUrl: widget._pubInfo["pubImage"],
      );
    } else {
      return FeedTextContent(
        description: widget._pubInfo["pubDesc"],
      );
    }
  }

  @override
  Widget renderBottom() {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.thumb_up,
                color: (this._likeState ? Colors.blue : Colors.grey),
              ),
              onPressed: () {
                if(!this._likeState) {
                  DocumentReference dr = Firestore.instance.collection("users").document(widget._userInfo["userId"])
                      .collection("publicacao").document(widget._pubInfo["pubId"]);

                  Firestore.instance.collection("users").document(model.firebaseUser.uid)
                      .collection("likes").document().setData({"publicacao" : dr});

                  // Incrementa like...

                  setState(() {
                    this._likeState = true;
                  });
                } else {
                  this._getLikeDocument(model, widget._pubInfo).then((value) {
                    try {
                      value.delete();

                      // Decrementa like...

                      setState(() {
                        this._likeState = false;
                      });
                    } catch(error) {
                      print("Não foi possível remover o like...");
                      print("\n" + error.toString());
                    }
                  });
                }
              },
            ),
            FlatButton(
              child: Icon(
                (this._favState ? Icons.favorite : Icons.favorite_border),
                color: (this._favState ? Colors.red : Colors.grey),
              ),
              onPressed: () {
                if(!this._favState) {
                  setState(() {
                    this._favState = true;
                  });
                } else {
                  setState(() {
                    this._favState = false;
                  });
                }
              },
            ),
            FlatButton(
              onPressed: () {
                Usuario u = new Usuario();
                u.nome=widget._userInfo["userName"];
                u.idUsuario=widget._userInfo["userId"];
                u.urlImagem=widget._userInfo["userImage"] == null ? "" : widget._userInfo['userImage'];
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Mensagens(u, model: model)),
                );
              },
              child: Icon(
                Icons.comment,
                color: Colors.black,
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(Icons.share),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(Icons.shopping_cart),
            )
          ],
        );
      }
    );
  }

  Future<bool> _getLikeState(UserModel model, Map<String, String> pubInfo) async {
    bool liked = false;

    QuerySnapshot q = await Firestore.instance.collection("users")
        .document(model.firebaseUser.uid).collection("likes").getDocuments();
    for(DocumentSnapshot ds in q.documents) {
      DocumentReference dr = ds.data["publicacao"];
      if(dr.documentID == pubInfo["pubId"]) {
        liked = true;
      }
    }

    return liked;
  }

  Future<DocumentReference> _getLikeDocument(UserModel model, Map<String, String> pubInfo) async {

    QuerySnapshot q = await Firestore.instance.collection("users")
        .document(model.firebaseUser.uid).collection("likes").getDocuments();
    for(DocumentSnapshot ds in q.documents) {
      DocumentReference dr = ds.data["publicacao"];
      if(dr.documentID == pubInfo["pubId"]) {
        print("Path: " + ds.reference.path);
        return ds.reference;
      }
    }

    return null;
  }

}

