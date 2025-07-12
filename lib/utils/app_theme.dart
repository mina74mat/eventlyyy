import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    focusColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)
          )
      ),
    ),
    textTheme: TextTheme(
        headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16
        ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
        headlineMedium: TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.w500,
            fontSize: 16
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        shape: StadiumBorder(
            side: BorderSide(
                width: 6,
                color: Colors.white
            )
        )
    ),





  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    focusColor: AppColors.primaryLight,
    scaffoldBackgroundColor: Color(0xff101127),
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)
          )
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
          color: AppColors.primaryLight,
          fontWeight: FontWeight.w500,
          fontSize: 16
      ),
      headlineMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        shape: StadiumBorder(
            side: BorderSide(
                width: 6,
                color: Colors.white
            )
        )
    ),



  );
}
