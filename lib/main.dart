import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
   seedColor: const Color(0xff6e896a)
  );
final kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
   seedColor: Colors.green
);
void main() {
  runApp(
    MaterialApp(
      home: const Expenses(),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkScheme.secondaryContainer,
          elevation: 5,
          shadowColor: Colors.green,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8
          )
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkScheme.primaryContainer,
            foregroundColor: kDarkScheme.onPrimaryContainer
          )
        ),
        // textTheme: ThemeData.dark().textTheme.copyWith(
        //   titleLarge: TextStyle(
        //     fontWeight: FontWeight.normal,
        //     //fontSize: 14,
        //     color: kDarkScheme.onSecondaryContainer
        //   ),
        //   bodyLarge: TextStyle(
        //     fontSize: 18,
        //     fontWeight: FontWeight.bold,
        //     color: kDarkScheme.onSecondaryContainer
        //   ),
        //   bodyMedium: TextStyle(
        //     fontWeight: FontWeight.normal,
        //     color: kDarkScheme.onSecondaryContainer
        //   ),
    ),
      theme: ThemeData().copyWith(
        //scaffoldBackgroundColor: Colors.purple.shade100,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          elevation: 5,
          shadowColor: Colors.green,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8
          )
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            //fontSize: 14,
            color: kColorScheme.onSecondaryContainer
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer
          ),
        )
      )
    ),  
  );
}

