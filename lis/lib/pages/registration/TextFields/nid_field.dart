import 'package:flutter/material.dart';

class NidField extends StatelessWidget {
  const NidField({
    Key key,
    @required bool autoValidate,
    @required this.nidController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController nidController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: nidController,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (String value) {
          nidController.text = value;
        },
        validator: (value) => value.isEmpty ? 'NID is required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your NID number',
          prefixIcon: Icon(
            Icons.credit_card,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
