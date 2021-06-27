import 'package:flutter/material.dart';

class SelectBirthYear extends StatefulWidget {
  static String dropdownValue = 'Year';
  @override
  _SelectBirthYearState createState() => _SelectBirthYearState();
}

class _SelectBirthYearState extends State<SelectBirthYear> {
  List<String> listValue = ['Year'];
  var now = new DateTime.now();
  @override
  void initState() {
    for (int i = 1905; i < (now.year + 1); i++) {
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
          value: SelectBirthYear.dropdownValue,
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
              SelectBirthYear.dropdownValue = newValue;
            });
            print(SelectBirthYear.dropdownValue);
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
