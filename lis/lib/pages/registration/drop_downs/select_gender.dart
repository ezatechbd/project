import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  static String dropdownValue = 'Select';
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  List<String> listValue = [
    'Select',
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.4)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButton<String>(
          isExpanded: false,
          value: SelectGender.dropdownValue,
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
              SelectGender.dropdownValue = newValue;
            });
            print(SelectGender.dropdownValue);
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
