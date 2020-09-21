import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  const IconTile({this.label, this.iconData, this.onTap, this.high});

  final String label;
  final iconData;
  final VoidCallback onTap;
  final bool high;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          color: high ? Colors.blue : Colors.black,
        ),
      ),
      leading: Icon(
        iconData,
        color: high ? Colors.blue : Colors.black,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20,0,10,0),
    );
  }
}