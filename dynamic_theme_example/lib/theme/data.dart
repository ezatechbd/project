import 'package:dynamicthemeexample/theme/theme_values.dart';
import 'package:flutter/material.dart';
import 'model.dart';

List<ThemeSwitcherModel> getThemeData() {
  List<ThemeSwitcherModel> data = [];
  data.add(
    ThemeSwitcherModel(
      themeData: pinkTheme,
      color: Color(0xFFF49FB6),
      spValue: 'pinkTheme',
    ),
  );
  data.add(
    ThemeSwitcherModel(
      themeData: halloweenTheme,
      color: Color(0xFF55705A),
      spValue: 'halloweenTheme',
    ),
  );
  data.add(
    ThemeSwitcherModel(
      themeData: darkBlueTheme,
      color: Color(0xFF1E1E2C),
      spValue: 'darkBlueTheme',
    ),
  );
  data.add(
    ThemeSwitcherModel(
      themeData: redTheme,
      color: Colors.red,
      spValue: 'redTheme',
    ),
  );
  data.add(
    ThemeSwitcherModel(
      themeData: purpleTheme,
      color: Colors.purple[900],
      spValue: 'purpleTheme',
    ),
  );
  data.add(
    ThemeSwitcherModel(
      themeData: tealTheme,
      color: Colors.teal,
      spValue: 'tealTheme',
    ),
  );
  return data;
}
