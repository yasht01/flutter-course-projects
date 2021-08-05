import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.cloud_outlined,
              color: Colors.white,
              size: 40.0,
            ),
          ),
          SizedBox(width: 60.0),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/location');
            },
            child: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}