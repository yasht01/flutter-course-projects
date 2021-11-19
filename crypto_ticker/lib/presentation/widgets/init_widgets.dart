import 'package:flutter/material.dart';

class CryptoNameWidget extends StatelessWidget {
  late String? text;
  CryptoNameWidget({Key? key, String? inputText}) : super(key: key) {
    this.text = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Text(
            text!,
            style: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  late IconData icon;
  late double size;
  late Function onPressedCallback;
  TransparentButton(
      {Key? key, IconData? icon, double? iconSize, Function? callback})
      : super(key: key) {
    this.icon = icon!;
    this.size = iconSize!;
    this.onPressedCallback = callback!;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressedCallback(),
      child: Icon(
        this.icon,
        size: size,
      ),
      splashColor: Colors.blue.withOpacity(1.0),
      shape: CircleBorder(),
      elevation: 0,
      highlightElevation: 0,
      fillColor: Colors.blue.withOpacity(0.3),
    );
  }
}
