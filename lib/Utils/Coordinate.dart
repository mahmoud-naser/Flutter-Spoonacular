import 'package:finalproject/Utils/Informations.dart';
import 'package:flutter/cupertino.dart';

class coordinate
{
  static Color yalow = const Color(0xFFEFD621);
  static Color blue = const Color(0xFF17b4e4);
  static Color red = const Color(0xFF990100);
  static Color orange = const Color(0xFFFFA101);

  static String getFont() {
    settings s=settings();
    if (s.lang == Language.en)
      return "PatuaOne-Regular";
    else if (s.lang == Language.es)
      return "Pacifico-Regular";
    else
      return "Amiri-Bold";
  }

}