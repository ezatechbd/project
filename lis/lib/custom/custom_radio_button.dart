import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  static int groupValue = -1;

  final String title;
  final String option1;
  final String option2;

  const CustomRadioButton(
      {Key key,
      @required this.title,
      @required this.option1,
      @required this.option2})
      : super(key: key);
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(widget.title, style: TextStyle(fontSize: 18)),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        value: 0,
                        groupValue: CustomRadioButton.groupValue,
                        title: Text(widget.option1),
                        onChanged: (newValue) => setState(
                            () => CustomRadioButton.groupValue = newValue),
                        activeColor: Colors.red,
                        selected: false,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        value: 1,
                        groupValue: CustomRadioButton.groupValue,
                        title: Text(widget.option2),
                        onChanged: (newValue) => setState(
                            () => CustomRadioButton.groupValue = newValue),
                        activeColor: Colors.red,
                        selected: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
