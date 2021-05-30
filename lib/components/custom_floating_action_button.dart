import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  CustomFAB({this.customIcon, this.onFabPressed});
  final IconData customIcon;
  final Function onFabPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onLongPress: onFabPressed,
      onPressed: onFabPressed,
      child: Icon(customIcon),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
