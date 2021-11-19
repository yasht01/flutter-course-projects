import 'package:flutter/material.dart';

final kLabelTextStyle = TextStyle(
  fontFamily: 'Exo',
  fontWeight: FontWeight.w600,
);

final kSmallButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
      // side: BorderSide(color: Colors.transparent),
    ),
  ),
  elevation: MaterialStateProperty.all(10),
);

final kHighlightSmallButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  ),
  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
  elevation: MaterialStateProperty.all(0),
);
