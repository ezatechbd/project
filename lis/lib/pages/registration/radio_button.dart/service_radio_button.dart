import 'package:flutter/material.dart';

class ServiceRadioButton extends StatefulWidget {
  static int groupValue = -1;
  final Function onTap;

  const ServiceRadioButton({Key key, @required this.onTap}) : super(key: key);
  @override
  _ServiceRadioButtonState createState() => _ServiceRadioButtonState();
}

class _ServiceRadioButtonState extends State<ServiceRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Are You On Service?', style: TextStyle(fontSize: 18)),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  child: RadioListTile(
                    value: 1,
                    groupValue: ServiceRadioButton.groupValue,
                    title: Text('Yes'),
                    onChanged: (newValue) {
                      setState(() {
                        ServiceRadioButton.groupValue = newValue;
                        widget.onTap();
                      });
                      print(ServiceRadioButton.groupValue);
                    },
                    activeColor: Colors.red,
                    selected: false,
                  ),
                ),
                Container(
                  height: 40,
                  child: RadioListTile(
                    value: 0,
                    groupValue: ServiceRadioButton.groupValue,
                    title: Text('No, I\'m Retired'),
                    onChanged: (newValue) {
                      setState(() {
                        ServiceRadioButton.groupValue = newValue;
                        widget.onTap();
                      });
                      print(ServiceRadioButton.groupValue);
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
