import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Widget blockChild;
  final List<BoxShadow> blockShadow;
  final Color blockColor;

  Block(
      {@required this.blockChild, this.blockShadow, @required this.blockColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: blockColor,
            boxShadow: blockShadow,
          ),
          child: blockChild,
        ),
      ),
    );
  }
}