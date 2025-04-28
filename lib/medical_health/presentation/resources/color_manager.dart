import 'package:flutter/material.dart';


class MyHexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  MyHexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class ColorManager {
  static MyHexColor primaryColor = MyHexColor('#2260FF');
  static MyHexColor lightPrimaryColor = MyHexColor('#CAD6FF');
  static MyHexColor lightPrimaryColor2Color = MyHexColor('#4378FF');
  static MyHexColor lightBlueColor = MyHexColor('#A9BCFE');
  static MyHexColor hintTextColor = MyHexColor('#809CFF');
  static MyHexColor whiteColor = MyHexColor('#FFFFFF');
  static MyHexColor textBlackColor = MyHexColor('#000000');
  static MyHexColor textBlack2Color = MyHexColor('#070707');
  static MyHexColor textFromFieldColor = MyHexColor('#ECF1FF');
  static MyHexColor selectedColor = MyHexColor('#00278C');

}