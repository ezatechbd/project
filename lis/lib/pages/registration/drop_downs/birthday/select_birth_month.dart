import 'package:flutter/material.dart';

class SelectBirthMonth extends StatefulWidget {
  static String dropdownValue;
  @override
  _SelectBirthMonthState createState() => _SelectBirthMonthState();
}

class _SelectBirthMonthState extends State<SelectBirthMonth> {
  List<String> listValue = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.4)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Month"),
          ),
          value: SelectBirthMonth.dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30, //this inicrease the size
          elevation: 16,
          style: TextStyle(color: Colors.black),
          validator: (newVal) => newVal == null ? ' * required' : null,
          onChanged: (String newValue) {
            setState(() {
              SelectBirthMonth.dropdownValue = newValue;
            });
            print(SelectBirthMonth.dropdownValue);
          },
          items: listValue.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(value),
              ),
            );
          }).toList(),
        ));
  }
}
