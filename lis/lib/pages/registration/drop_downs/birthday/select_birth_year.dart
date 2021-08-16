import 'package:flutter/material.dart';

class SelectBirthYear extends StatefulWidget {
  static String dropdownValue;
  @override
  _SelectBirthYearState createState() => _SelectBirthYearState();
}

class _SelectBirthYearState extends State<SelectBirthYear> {
  List<String> listValue = [];
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
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.4)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Year"),
          ),
          value: SelectBirthYear.dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30, //this inicrease the size
          elevation: 16,
          style: TextStyle(color: Colors.black),
          validator: (newVal) => newVal == null ? ' * required' : null,
          onChanged: (String newValue) {
            setState(() {
              SelectBirthYear.dropdownValue = newValue;
            });
            print(SelectBirthYear.dropdownValue);
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
