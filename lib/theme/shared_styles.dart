import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration fieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.grey[100],
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black,
        // offset: Offset(2.0, 2.0),
        blurRadius: 2.0,
      ),
      // BoxShadow(
      //   color: Colors.white,
      //   offset: Offset(-2.0, -2.0),
      //   blurRadius: 2.0,
      // ),
    ]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables
const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: Colors.black);

// Colors
const Color offWhiteColor = Color.fromARGB(248, 248, 255, 255);
