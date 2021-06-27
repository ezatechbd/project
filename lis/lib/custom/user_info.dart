import 'package:ati_lis/custom/timeline_widget.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String title;
  final String info;
  final Function onTap;

  UserInfo({@required this.title, @required this.info, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTimeLine(height: 50),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          flex: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                info,
                style: TextStyle(fontSize: 18),
              ),
              Divider(
                thickness: 1.0,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        // IconButton(
        //     icon: Icon(
        //       FontAwesomeIcons.edit,
        //       size: 15,
        //     ),
        //     onPressed: () {
        //       onTap();
        //     })
      ],
    );
  }
}
