import 'package:flutter/material.dart';


const Color chatBubbleColor1 = Color(0xffbb6377);
const Color chatBubbleColor2 = Color(0xFF474747);

const Color chatTextColor2 = Color(0xffffffff);
const Color chatTextColor1 = Color(0xffc2c2c2);


Color get chatTimeColor2 => chatTextColor2.withOpacity(0.5);
Color get chatTimeColor1 => chatTextColor1.withOpacity(0.5);

const Color green = Color(0xFF53E496);
const Color blue = Color(0xFF0066FF);
const Color red = Color(0xFFFF4949);
const Color pageBackground = Color(0xFFE5E5E5);
const Color containerBackground = Color(0xFFFFFFFF);
const Color inputBackground = Color(0xFFF0F2F3);
const Color inputBorder = Color(0xFFB4B4B4);
const Color mainTextColor = Color(0xFFB4B4B4);
const Color iconColor = Color(0xFF000000);
const Color activeIconColor = Color(0xFF0066FF);
const Color activeButtonColor = Color(0xFFFFFFFF);
const Color textColor1 = Color(0xFF909090);
const Color dividerColor = Color(0xFFC2C2C2);
const Color textColor2 = Color(0xFFA2A2A2);
const Color textColor3 = Color(0xFFABABAB);

class MyColors {
  static const Color green = Color(0xFF53E496);
  static const Color blue = Color(0xFF0066FF);
  static const Color red = Color(0xFFFF4949);
  static const Color pageBackground = Color(0xFFFFFFFF);
  static const Color containerBackground = Color(0xFFF7F7F7);
  static const Color inputBackground = Color(0xFFEFEFEF);
  static const Color inputBorder = Color(0xFFB4B4B4);
  static const Color mainTextColor = Color(0xFF000000);
  static const Color iconColor = Color(0xFF000000);
  static const Color activeIconColor = Color(0xFF0066FF);
  static const Color activeButtonColor = Color(0xFFFFFFFF);
  static const Color textColor1 = Color(0xFFC2C2C2);
  static const Color dividerColor = Color(0xFFC2C2C2);
  static const Color textColor2 = Color(0xFFA2A2A2);
  static const Color textColor3 = Color(0xFFABABAB);
  static const Color white = Colors.white;

  static const MaterialColor primaryColor = MaterialColor(
    0xFF1379A2,
    <int, Color>{
      50:Color(0xFF1379A2),
      100:Color(0xFF1379A2),
      200:Color(0xFF1379A2),
      300:Color(0xFF1379A2),
      400:Color(0xFF1379A2),
      500:Color(0xFF1379A2),
      600:Color(0xFF1379A2),
      700:Color(0xFF1379A2),
      800:Color(0xFF1379A2),
      900:Color(0xFF1379A2),
    },
  );


  // static MaterialColor primaryColor = createMaterialColor(const Color(0xFF1379A2));


  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

}

