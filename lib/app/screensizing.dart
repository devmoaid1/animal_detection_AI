import 'package:flutter/cupertino.dart';

class ScreenSizeHelper {
  double? screenWidth;
  double? screenHeight;
  double? blockScreenSizeVertical;
  double? blockScreenSizeHorizontal;
  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    blockScreenSizeHorizontal = screenWidth! / 100;
    blockScreenSizeVertical = screenHeight! / 100;
  }
}
