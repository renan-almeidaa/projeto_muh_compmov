
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';

class FeedImage extends Feed {

  FeedImage({@required context, @required userInfo, @required pubInfo})
      : super(context: context, userInfo: userInfo, pubInfo: pubInfo);

  @override
  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(super.pubInfo["pubDesc"]),
        ),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(super.pubInfo["pubImage"])
            )
          ),
        ),
      ],
    );
  }

}