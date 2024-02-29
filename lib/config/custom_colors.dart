import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();

  static Color get primary {
    // return const Color.fromARGB(255, 255, 213, 0);
    return colorFrom('009688');
  }

  static Color get shadow {
    return const Color.fromARGB(51, 39, 44, 51);
  }

  static Color get black {
    return Colors.black;
  }

  static Color transparent = Colors.transparent;

  static Color get blue {
    return Colors.blue;
  }

  static Color get white {
    return Colors.white;
  }

  static Color get purple {
    return Colors.purple;
  }

  static Color get lightPurple {
    return Colors.purple.shade50;
  }

  static Color get darkGrey {
    return Colors.grey;
  }

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

  static Color colorFrom(String hex) {
    final hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }
}
