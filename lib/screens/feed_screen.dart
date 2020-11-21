
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/utils/default_scaffold.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class FeedScreen extends StatefulWidget {

  @override
  _FeedScreenState createState() => _FeedScreenState();

}

class _FeedScreenState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if(model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return DefaultScaffold(
            bodyWidget: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1));
                setState(() {});
              },
              child: FutureBuilder(
                future: this._getAllPublications(model),
                builder: (_, feedList) {
                  if(feedList.connectionState == ConnectionState.waiting) {
                    return new Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      children: feedList.data,
                    );
                  }
                }
              ),
            ),
            backgroundColor: Colors.grey[100],
          );
        }
      }
    );
  }

  Future<List<Widget>> _getAllPublications(UserModel model) async {
    List<Widget> pubWidgetList = [];
    for(DocumentSnapshot ds in await model.getUsers()) { // Pega os usuários
      // Monta o mapa com as informações do usuário
      Map<String, String> userInfo = {
        "userId" : ds.documentID,
        "userName" : ds.data["name"] + " " + ds.data["lastname"],
        "userImage" : ds.data["imagem"],
      };

      List<DocumentSnapshot> pubListDS = await model.getUserPublication(ds.documentID);
      for(DocumentSnapshot pub_ds in pubListDS) { // Pega as publicações do usuário
        // Monta o mapa com as informações da publicação
        Map<String, String> pubInfo = {
          "pubId" : pub_ds.documentID,
          "pubDesc" : pub_ds.data["descrição"],
          "pubDate" : pub_ds.data["formatted"],
          "pubImage" : pub_ds.data["image"],
        };

        pubWidgetList.add(Feed(userInfo: userInfo, pubInfo: pubInfo));
      }
    }

    return pubWidgetList;
  }

}