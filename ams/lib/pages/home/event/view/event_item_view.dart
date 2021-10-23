import 'package:flutter/material.dart';

class ActivityItemView extends StatelessWidget {
  const ActivityItemView({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.iconColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )
          ],
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
