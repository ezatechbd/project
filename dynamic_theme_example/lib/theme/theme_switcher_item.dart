import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dynamicthemeexample/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSwitcherItem extends StatelessWidget {
  final ThemeData themeData;
  final Color color;
  final String spValue;
  const ThemeSwitcherItem({
    Key key,
    @required this.themeData,
    @required this.color,
    @required this.spValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: ThemeSwitcher(
        builder: (ctx) {
          return InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('spColorValue', spValue);
              ThemeSwitcher.of(ctx).changeTheme(
                theme: themeData,
              );
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(),
              //   ),
              //   (Route<dynamic> routue) => false,
              // );
            },
            child: CircleAvatar(
              backgroundColor: color,
              radius: 20,
            ),
          );
        },
      ),
    );
  }
}
