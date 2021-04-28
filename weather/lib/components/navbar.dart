import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print('Select city');
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
              print('Add city');
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