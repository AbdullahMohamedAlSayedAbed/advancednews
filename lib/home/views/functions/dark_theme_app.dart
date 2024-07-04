import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkThemeApp() {
  return ThemeData(
      primarySwatch: Colors.deepOrange,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          )),
      scaffoldBackgroundColor: const Color(0xff333739),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          backgroundColor: Color(0xff333739),
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color(0xff333739),
          iconTheme: IconThemeData(color: Colors.white, size: 25),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff333739),
            statusBarIconBrightness: Brightness.light,
          )));
}
