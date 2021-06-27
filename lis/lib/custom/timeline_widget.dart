import 'package:ati_lis/config/common_const.dart';
import 'package:flutter/material.dart';

class CustomTimeLine extends StatelessWidget {
  final double height;
  CustomTimeLine({@required this.height});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 18,
            height: 18,
            decoration: new BoxDecoration(
              color: cViolet,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 3,
            height: height,
            decoration: new BoxDecoration(
              color: cSky,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
