import 'package:flutter/material.dart';

import 'package:crypto_ticker/shared/constants.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Align(
          alignment: Alignment(-0.9, 0.5),
          child: Container(
            color: Colors.blue.withOpacity(0.9),
            width: 200,
            height: 200,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
        ),
        Align(
          alignment: Alignment(0.9, 0.5),
          child: Container(
            color: Colors.blue.withOpacity(0.9),
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }
}

class TimeButton extends StatelessWidget {
  late String text;
  late Function callback;
  late bool isHighlighted;
  TimeButton({Key? key, String? text, Function? callback, bool? highlight})
      : super(key: key) {
    this.text = text!;
    this.callback = callback!;
    this.isHighlighted = highlight!;
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;

    if (this.isHighlighted)
      buttonStyle = kSmallButtonStyle;
    else
      buttonStyle = kHighlightSmallButtonStyle;

    return ElevatedButton(
      onPressed: () => this.callback,
      child: Text(
        this.text,
        style: kLabelTextStyle,
      ),
      style: buttonStyle,
    );
  }
}
