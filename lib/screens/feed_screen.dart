
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:projeto_muh_compmov/feed/feed_image.dart';
import 'package:projeto_muh_compmov/utils/default_scaffold.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/feed/ifeed.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(_App());

// Test main
class _App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'Muh',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color.fromARGB(255, 0, 0, 0)
          ),
          home: DefaultScaffold(bodyWidget: FeedScreen(), backgroundColor: Colors.grey[100],),
          debugShowCheckedModeBanner: false,
        )
    );
  }

}

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
            bodyWidget: FutureBuilder(
              future: this._getAllPublications(model),
              builder: (_, feedList) {
                if(feedList.connectionState == ConnectionState.waiting) {
                  return new Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: feedList.data.length,
                    itemBuilder: (context, index) => feedList.data[index].render(),
                  );
                }
              }
            ),
            backgroundColor: Colors.grey[100],
          );
        }
      }
    );
  }

  Future<List<IFeed>> _getAllPublications(UserModel model) async {
    List<IFeed> pub = [];
    for(DocumentSnapshot ds in await model.getUsers()) { // Pega os usuários
      // Monta o mapa com as informações do usuário
      Map<String, String> userInfo = {
        "userId" : ds.documentID,
        "userName" : ds.data["name"] + " " + ds.data["lastname"],
        "userImage" : ds.data["imagem"],
      };

      List<DocumentSnapshot> pub_ds_l = await model.getUserPublication(ds.documentID);
      for(DocumentSnapshot pub_ds in pub_ds_l) { // Pega as publicações do usuário
        // Monta o mapa com as informações da publicação
        Map<String, String> pubInfo = {
          "pubId" : pub_ds.documentID,
          "pubDesc" : pub_ds.data["descrição"],
          "pubDate" : pub_ds.data["formatted"],
          "pubImage" : pub_ds.data["image"],
        };

        if(pubInfo["pubImage"].isNotEmpty) {
          pub.add(FeedImage(context: context, userInfo: userInfo, pubInfo: pubInfo));
        } else {
          pub.add(Feed(context: context, userInfo: userInfo, pubInfo: pubInfo));
        }

      }
    }

    return pub;
  }

}



