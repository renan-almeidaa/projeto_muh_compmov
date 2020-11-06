
import 'package:flutter/material.dart';

// TODO: Inserir Scopped Model Descendant para obter informações do usuário sobre a publicação

// ignore: must_be_immutable
class StatefulFlatButton extends StatefulWidget {

  bool _state;
  IconData _icon;
  Color _fillColor;
  final IconData iconInactive;
  final IconData iconActive;
  final Color fillColorInactive;
  final Color fillColorActive;

  StatefulFlatButton({
    @required bool state,
    @required this.iconActive,
    @required this.iconInactive,
    this.fillColorActive = Colors.blue,
    this.fillColorInactive = Colors.grey})
      : this._state = state
  {
    if(state) {
      this._icon = iconActive;
      this._fillColor = fillColorActive;
    }
    else {
      this._icon = iconInactive;
      this._fillColor = fillColorInactive;
    }
  }

  @override
  State<StatefulFlatButton> createState() => _StatefulFlatButtonState();

}

class _StatefulFlatButtonState extends State<StatefulFlatButton> {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Icon(widget._icon, color: widget._fillColor),
    );
  }

  void onPressed() {
    setState(() {
      if (!widget._state) {
        widget._state = true;
        widget._icon = widget.iconActive;
        widget._fillColor = widget.fillColorActive;
      } else {
        widget._state = false;
        widget._icon = widget.iconInactive;
        widget._fillColor = widget.fillColorInactive;
      }
    });
  }
}