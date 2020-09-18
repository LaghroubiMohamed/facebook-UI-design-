import 'package:flutter/material.dart';

class CirleBotton extends StatelessWidget {
  const CirleBotton({
    Key key,
    this.icon,
    this.onPressed,
    this.iconSize,
  }) : super(key: key);

  @required
  final IconData icon;
  @required
  final Function onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.black,
        iconSize: iconSize,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
