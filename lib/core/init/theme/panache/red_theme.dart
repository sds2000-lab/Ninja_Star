import 'package:flutter/material.dart';

const String FONT_FAMILY = 'Poppins';

final ThemeData redTheme = ThemeData(
  fontFamily: FONT_FAMILY,
  brightness: Brightness.light,
  primaryColor: const Color(0xffC20003),
  primaryColorLight: const Color(0xffffcdd2),
  primaryColorDark: const Color(0xffd32f2f),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0xffffffff),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0xffE8E8E8),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: const Color(0xffffebee),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xffC20003),
  hintColor: const Color(0x8a000000),
  
  toggleButtonsTheme: const ToggleButtonsThemeData(
    fillColor: Color(0xffC20003), 
    textStyle: TextStyle(color: Colors.white), 
    selectedColor: Colors.white,
  ),
  
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffC20003)
  ),

  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.only(left: 16, right: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xfff44336),
      secondary: Color(0xffC20003),
      surface: Color(0xffffffff),
      background: Color(0xffef9a9a),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0x8a000000),
      fontSize: 35,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: TextStyle(
      color: Color(0xdd000000),
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: Color(0x8a000000),
      fontSize: 25,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: Color(0x8a000000),
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: Color(0xdd000000),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: Color(0xdd000000),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: Color(0xdd000000),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: Color(0x8a000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelMedium: TextStyle(
      color: Color(0xff000000),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  
  primaryTextTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 35,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 25,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: Color(0xfffafafa),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: Color(0xfffafafa),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: Color(0xb3ffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelMedium: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    contentPadding: EdgeInsets.only(top: 12, bottom: 12),
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
  
  iconTheme: const IconThemeData(
    color: Color(0xdd000000),
    opacity: 1,
    size: 24,
  ),
  
  primaryIconTheme: const IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),

  sliderTheme: const SliderThemeData(
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  
  tabBarTheme: const TabBarThemeData(
    labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 10),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xffffffff),
    unselectedLabelColor: Color(0xb2ffffff),
  ),
  
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3df44336),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(),
  ),
  
  dialogTheme: const DialogThemeData(
    shape: RoundedRectangleBorder(),
  ),
  
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff4285f4), 
    selectionColor: Color(0xffef9a9a), 
    selectionHandleColor: Color(0xffe57373),
  ),
  
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
    secondary: const Color(0xfff44336)
  ),
);
