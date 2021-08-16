import 'package:flutter/material.dart';

class SelectBirthDay extends StatefulWidget {
  static String dropdownValue;
  @override
  _SelectBirthDayState createState() => _SelectBirthDayState();
}

class _SelectBirthDayState extends State<SelectBirthDay> {
  List<String> listValue = [];
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
          value: SelectBirthDay.dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30, //this inicrease the size
          elevation: 16,
          style: TextStyle(color: Colors.black),
          validator: (newVal) => newVal == null ? ' * required' : null,
          onChanged: (String newValue) {
            setState(() {
              SelectBirthDay.dropdownValue = newValue;
            });
            print(SelectBirthDay.dropdownValue);
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
