import 'package:flutter/material.dart';

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