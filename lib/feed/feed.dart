import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:projeto_muh_compmov/feed/ifeed.dart';
import 'package:projeto_muh_compmov/models/Usuario.dart';
import 'package:projeto_muh_compmov/screens/mensagens.dart';
import 'package:projeto_muh_compmov/utils/stateful_flat_button.dart';

class Feed implements IFeed {

  // UserInfo: userId, userName, userImage
  // PubInfo: pubId, pubDesc, pubDate, pubImage

  final Map<String, String> _userInfo;
  final Map<String, String> _pubInfo;

  final BuildContext _context;

  Map<String, String> get userInfo {
    return this._userInfo;
  }

  Map<String, String> get pubInfo {
    return this._pubInfo;
  }

  bool _favState = false; // Informação se o usuário favoritou a publicação
  bool _likeState = false; // Informação se o usuário curtiu a publicação
  // A data tem que ser de acordo com a data de publicação
  // que vem do banco de dados.
  Feed({@required context, @required userInfo, @required pubInfo})
    : this._context = context, this._userInfo = userInfo, this._pubInfo = pubInfo;

  @override
  Widget render() {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: null, // Vai pro perfil
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage((this._userInfo["userImage"] == null ? "" : this._userInfo["userImage"]))
                )
              ),
            ),
            title: Text(this._userInfo["userName"]),
            subtitle: Text("Enviado em ${DateFormat("dd/MM/yyyy").format(DateTime.parse(this._pubInfo["pubDate"]))}"),
          ),
          renderContent(),
          renderBottom(),
        ],
      ),
    );
  }

  @override
  Widget renderContent() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(this._pubInfo["pubDesc"]),
        ),
      ],
    );
  }

  @override
  Widget renderBottom() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        StatefulFlatButton(
          state: this._likeState,
          iconActive: Icons.thumb_up,
          iconInactive: Icons.thumb_up,
        ),
        StatefulFlatButton(
          state: this._favState,
          iconActive: Icons.favorite,
          iconInactive: Icons.favorite_border,
          fillColorActive: Colors.red,
        ),
        FlatButton(
            onPressed: () {
              Usuario u ;
              u.nome=_userInfo['userName'];
              u.idUsuario=_userInfo['userId'];
              u.urlImagem=_userInfo['userImage'] == null ? "" : _userInfo['userImage'];
              Navigator.of(this._context).push(
                MaterialPageRoute(builder: (context) => Mensagens(u)),
              );
            },
            child: Icon(Icons.comment),
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

  bool _getLikeState() {

  }

}

