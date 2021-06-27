import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key key,
    @required bool autoValidate,
    @required this.nameController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: nameController,
        onFieldSubmitted: (String value) {
          nameController.text = value;
        },
        validator: (value) => value.isEmpty ? 'Name is required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your name',
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
