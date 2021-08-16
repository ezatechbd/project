import 'package:flutter/material.dart';

class SelectAgeDay extends StatefulWidget {
  static String dropdownValue;
  @override
  _SelectAgeDayState createState() => _SelectAgeDayState();
}

class _SelectAgeDayState extends State<SelectAgeDay> {
  List<String> listValue = [];
  var now = new DateTime.now();
  @override
  void initState() {
    for (int i = 1; i < 31; i++) {
      listValue.add(i.toString());
    }
    super.initState();
  }

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
            child: Text("Day"),
          ),
          validator: (newVal) => newVal == null ? ' * required' : null,
          value: SelectAgeDay.dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30, //this inicrease the size
          elevation: 16,
          style: TextStyle(color: Colors.black),
          onChanged: (String newValue) {
            setState(() {
              SelectAgeDay.dropdownValue = newValue;
            });
            print(SelectAgeDay.dropdownValue);
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
