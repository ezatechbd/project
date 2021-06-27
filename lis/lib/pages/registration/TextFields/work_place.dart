import 'package:flutter/material.dart';

class WorkPlace extends StatelessWidget {
  const WorkPlace({
    Key key,
    @required bool autoValidate,
    @required this.workPlaceController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController workPlaceController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: workPlaceController,
        onFieldSubmitted: (String value) {
          workPlaceController.text = value;
        },
        validator: (value) => value.isEmpty ? 'Work place is required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your work palce',
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
