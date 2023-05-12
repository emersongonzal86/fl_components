import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static late final ThemeData lightTheme = ThemeData.light().copyWith(
      //color primario
      primaryColor: Colors.indigo,

      //AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      //TextButton Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary)),

// FloatingActionButtons//
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primary, elevation:5),

//ElevatedButtons//
 
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                shape:const StadiumBorder(),
                elevation:0
                ),
                )
);     

  //Tema oscuro

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //color primario
      primaryColor: Colors.indigo,
      //AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
