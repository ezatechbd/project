import 'package:flutter/material.dart';

class DefenseRadioButton extends StatefulWidget {
  static int groupValue = -1;

  final Function onTap;

  const DefenseRadioButton({Key key, @required this.onTap}) : super(key: key);
  @override
  _DefenseRadioButtonState createState() => _DefenseRadioButtonState();
}

class _DefenseRadioButtonState extends State<DefenseRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Are You A Defense Personnel?', style: TextStyle(fontSize: 18)),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  child: RadioListTile(
                    value: 0,
                    groupValue: DefenseRadioButton.groupValue,
                    title: Text('Yes'),
                    onChanged: (newValue) {
                      setState(() {
                        DefenseRadioButton.groupValue = newValue;
                        widget.onTap();
                      });
                    },
                    activeColor: Colors.red,
                    selected: false,
                  ),
                ),
                Container(
                  height: 40,
                  child: RadioListTile(
                    value: 1,
                    groupValue: DefenseRadioButton.groupValue,
                    title: Text('No'),
                    onChanged: (newValue) {
                      setState(() {
                        DefenseRadioButton.groupValue = newValue;
                        widget.onTap();
                      });
                    },
                    activeColor: Colors.red,
                    selected: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
