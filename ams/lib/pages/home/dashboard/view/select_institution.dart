import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectInstitution extends StatefulWidget {
  const SelectInstitution({
    Key key,
  }) : super(key: key);

  @override
  _SelectInstitutionState createState() => _SelectInstitutionState();
}

class _SelectInstitutionState extends State<SelectInstitution> {
  @override
  Widget build(BuildContext context) {
    List<String> institution = ['Birdem 1', 'Birdem 2'];
    String selectedInstitution;
    return DropdownButton<String>(
      hint: Text(institution[0]),
      items: institution.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: selectedInstitution,
      onChanged: (selectedValue) async {
        print(selectedValue);
        setState(() {
          selectedInstitution = selectedValue;
        });
        var spValue = selectedValue == 'Birdem 1' ? 'BIRDEM_01' : 'BIRDEM_02';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('institution', spValue);
      },
    );
  }
}
