import 'package:flutter/material.dart';

class SelectJobStatus extends StatefulWidget {
  static String dropdownValue = 'Select';
  @override
  _SelectJobStatusState createState() => _SelectJobStatusState();
}

class _SelectJobStatusState extends State<SelectJobStatus> {
  List<String> listValue = [
    'Select',
    'On Job',
    'Retired',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.4)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          value: SelectJobStatus.dropdownValue,
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
          //underline: Container(),
          validator: (newVal) => newVal == 'Select' ? 'required' : null,
          onChanged: (String newValue) {
            setState(() {
              SelectJobStatus.dropdownValue = newValue;
            });
            print(SelectJobStatus.dropdownValue);
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
