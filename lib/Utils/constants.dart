import 'package:flutter/material.dart';

class constants {
 
  //======================================
  static const Color backgroundColor = Color.fromARGB(255, 26, 27, 34);
  static const Color secodarycolor = Color.fromARGB(255, 255, 77, 103);
  static const Color fillcolor = Color.fromARGB(255, 47, 48, 55);
  static const Color white = Colors.white;
  static const Color offwhite = Color.fromARGB(255, 150, 143, 143);
  static const Color transparent = Colors.transparent;
  static const Color shimmerBase = Color.fromARGB(255, 31, 32, 38);
  static const Color shimmerhighlite = Color.fromARGB(255, 54, 55, 61);
  static Color blackOP5 = Colors.black.withOpacity(0.5);
  static Color blackOP9 = Colors.black.withOpacity(0.9);
  static Color blackOP2 = Colors.black.withOpacity(0.2);

// -----------------------------heights --------------------
  static const SizedBox height30 = SizedBox(
    height: 30,
  );
  static const SizedBox height20 = SizedBox(
    height: 20,
  );
  static const SizedBox height10 = SizedBox(
    height: 10,
  );
  static const SizedBox height3 = SizedBox(
    height: 3,
  );
  static const SizedBox width10 = SizedBox(
    width: 10,
  );

  static final RegExp regemail =
      RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}$");

  static final RegExp password = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  static final RegExp name = RegExp(r'^[A-Za-z]+$');

  static final phonreg = RegExp(r"^[6789]\d{9}$");
}
