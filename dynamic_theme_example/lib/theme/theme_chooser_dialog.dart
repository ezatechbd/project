import 'package:flutter/material.dart';
import 'data.dart';
import 'model.dart';
import 'theme_switcher_item.dart';

class ThemeChooserDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ThemeSwitcherModel> data = getThemeData();
    return AlertDialog(
      content: Container(
        height: 100,
        width: 200,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (3 / 2),
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ThemeSwitcherItem(
              color: data[index].color,
              themeData: data[index].themeData,
              spValue: data[index].spValue,
            );
          },
        ),
      ),
    );
  }
}
