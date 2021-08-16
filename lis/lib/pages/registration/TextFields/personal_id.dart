import 'package:flutter/material.dart';

class PersonalID extends StatelessWidget {
  const PersonalID({
    Key key,
    @required bool autoValidate,
    @required this.pIDController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController pIDController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: pIDController,
        onFieldSubmitted: (String value) {
          pIDController.text = value;
        },
        validator: (value) => value.isEmpty
            ? '* required'
            : (value.toUpperCase() != 'BA' &&
                    value.toUpperCase() != 'BN' &&
                    value.toUpperCase() != 'BAF')
                ? 'Enter valid ID'
                : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your personal ID',
          prefixIcon: Icon(
            Icons.format_list_numbered_sharp,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
