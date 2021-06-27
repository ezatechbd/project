import 'package:flutter/material.dart';

class AgeField extends StatelessWidget {
  const AgeField({
    Key key,
    @required bool autoValidate,
    @required this.ageController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: ageController,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (String value) {
          ageController.text = value;
        },
        validator: (value) => value.isEmpty ? 'Age is required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your age',
        ),
      ),
    );
  }
}
