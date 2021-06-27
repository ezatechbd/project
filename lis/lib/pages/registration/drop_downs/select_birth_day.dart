import 'package:flutter/material.dart';

class SelectBirthDay extends StatefulWidget {
  static String dropdownValue = 'Day';
  @override
  _SelectBirthDayState createState() => _SelectBirthDayState();
}

class _SelectBirthDayState extends State<SelectBirthDay> {
  List<String> listValue = ['Day'];
  var now = new DateTime.now();
  @override
  void initState() {
    for (int i = 1; i < 32; i++) {
      listValue.add(i.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.4)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButton<String>(
          isExpanded: false,
          value: SelectBirthDay.dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30, //this inicrease the size
          elevation: 16,
          style: TextStyle(color: Colors.black),
          // this is for underline
          // to give an underline us this in your underline inspite of Container
          //       Container(
          //         height: 2,
          //         color: Colors.grey,
          //       )
          underline: Container(),
          onChanged: (String newValue) {
            setState(() {
              SelectBirthDay.dropdownValue = newValue;
            });
            print(SelectBirthDay.dropdownValue);
          },
          items: listValue.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
