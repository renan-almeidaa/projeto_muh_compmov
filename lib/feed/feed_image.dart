
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';

class FeedImage extends Feed {

  final String imageUrl; // Url da imagem da publicação

  FeedImage({@required String text, @required userInfo, @required this.imageUrl})
      : super(text: text, userInfo: userInfo);

  @override
  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(super.text),
        ),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(this.imageUrl)
            )
          ),
        ),
      ],
    );
  }

}