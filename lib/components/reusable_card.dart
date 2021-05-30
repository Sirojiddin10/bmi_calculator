import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.changeActive});
  final Color colour;
  final Widget cardChild;
  final Function changeActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeActive,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
