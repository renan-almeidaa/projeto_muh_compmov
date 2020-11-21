import 'package:flutter/material.dart';

class FeedTextContent extends StatelessWidget {

  final String _description;

  FeedTextContent({@required description})
    : this._description = description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(this._description),
        ),
      ],
    );
  }
}
