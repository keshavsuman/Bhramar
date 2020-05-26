import 'package:flutter/material.dart';

class Styling {
  static double deviceHeight;
  static double deviceWidth;
  static double heightSizeMultiplier;
  static double widthSizeMultiplier;
  static double fontSizeMultiplier;
  static double blockSizeHorizontal;
  static double blockSizevertical;
  static double imageSizeMultiplier;

  static final String firstPageImage="images/page1.png";
  static final String secondPageImage="images/page2.png";
  static final String thirdPageImage="images/page3.png";
  static final String logo="images/Bhramarlogo3.png";

  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      deviceHeight = constraints.maxHeight;
      deviceWidth = constraints.maxWidth;
    }
    else {
      deviceWidth = constraints.maxHeight;
      deviceHeight = constraints.maxWidth;
    }
    blockSizeHorizontal = deviceWidth / 100;
    blockSizevertical = deviceHeight / 100;

    fontSizeMultiplier = blockSizeHorizontal;
    heightSizeMultiplier = blockSizevertical;
    widthSizeMultiplier = blockSizevertical;
    imageSizeMultiplier=blockSizeHorizontal;
  }
}