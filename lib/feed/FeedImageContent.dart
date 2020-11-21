import 'package:flutter/material.dart';

class FeedImageContent extends StatelessWidget {

  final String _imageUrl;
  final String _description;

  FeedImageContent({@required description, @required imageUrl})
    : this._imageUrl = imageUrl, this._description = description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(this._description),
        ),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(this._imageUrl)
              )
          ),
        ),
      ],
    );
  }
}