import 'package:flutter/material.dart';


class MyTheme {

  final ThemeData _theme;

  MyTheme(this._theme);


  ThemeData getTheme(){
    return _theme.copyWith(
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: _theme.colorScheme.copyWith(
          primary: Colors.green[900]
        ),
        textTheme: _theme.textTheme.copyWith(
          bodySmall: TextStyle(
            color: Colors.grey[700],
            fontSize: 15
          ),
          bodyMedium: TextStyle(
            color: Colors.grey[700],
            fontSize: 18
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[900],
            fontSize: 18
          )
        )
      );
  }

}


