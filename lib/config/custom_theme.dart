import 'package:cash_withdraw/config/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        // color: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      canvasColor: CustomColors.white,
      primarySwatch: CustomColors.getMaterialColor(CustomColors.primary),
      primaryColor: CustomColors.purple,
      scaffoldBackgroundColor: Colors.white,
      secondaryHeaderColor: CustomColors.primary,
      fontFamily: 'Montserrat', //3
      cardTheme: CardTheme(
        clipBehavior: Clip.hardEdge,
        color: CustomColors.white,
        shadowColor: CustomColors.darkGrey,
        surfaceTintColor: CustomColors.black,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      elevatedButtonTheme: getElevatedButtonThemeData(
        CustomColors.primary,
        CustomColors.white,
        CustomColors.white,
        CustomColors.transparent,
        CustomColors.primary,
        CustomColors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: CustomColors.getMaterialColor(CustomColors.darkGrey),
      primaryColor: CustomColors.darkGrey,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Montserrat',
      textTheme: ThemeData.dark().textTheme,
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: CustomColors.lightPurple,
      ),
      canvasColor: CustomColors.darkGrey,
      secondaryHeaderColor: CustomColors.primary,
      cardTheme: CardTheme(
        clipBehavior: Clip.hardEdge,
        color: CustomColors.darkGrey,
        shadowColor: CustomColors.white,
        surfaceTintColor: CustomColors.black,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      elevatedButtonTheme: getElevatedButtonThemeData(
        CustomColors.primary,
        CustomColors.white,
        CustomColors.black,
        CustomColors.transparent,
        CustomColors.primary,
        CustomColors.white,
      ),
    );
  }

  static ElevatedButtonThemeData getElevatedButtonThemeData(
    Color backgroundColor,
    Color foregroundColor,
    Color overlayColor,
    Color shadowColor,
    Color surfaceTintColor,
    Color iconColor,
  ) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 15)),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
        overlayColor: MaterialStatePropertyAll(overlayColor.withOpacity(0.5)),
        shadowColor: MaterialStatePropertyAll(CustomColors.transparent),
        surfaceTintColor: MaterialStatePropertyAll(CustomColors.primary),
        elevation: const MaterialStatePropertyAll(3),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
        iconColor: MaterialStatePropertyAll(CustomColors.white),
        iconSize: const MaterialStatePropertyAll(50),
        side: const MaterialStatePropertyAll(
            BorderSide(color: Colors.transparent)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
