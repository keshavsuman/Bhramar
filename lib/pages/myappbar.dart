import 'package:flutter/material.dart';
import '../ResponsiveSize.dart';

Widget myAppBar(context) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    elevation: 0,
    centerTitle: true,
    title: Container(
      width:7*Styling.heightSizeMultiplier,
      child: Image.asset(Styling.logo)),
  );
}
