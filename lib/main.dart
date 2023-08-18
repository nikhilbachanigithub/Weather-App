//main.dart
import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/screens/home_screen.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Initial theme mode is light

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? darkTheme : lightTheme,
      home: HomeScreen(
        isDarkMode: isDarkMode,
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode; // Toggle theme mode
          });
        },
      ),
      title: "Weather",
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData lightTheme = ThemeData(
  primaryColor: CustomColors.primaryLight,

  // ... other properties for light theme
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: CustomColors.primaryDark,

  dividerColor: CustomColors.dividerLineDark,
  cardColor: CustomColors.cardColorDark,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primaryDark,
    selectionColor: CustomColors.primaryDark.withOpacity(0.5),
    selectionHandleColor: CustomColors.primaryDark,
  ),
  // ... other properties for dark theme
);




