import 'package:flutter/material.dart';

class PermanentAddress extends StatelessWidget {
  const PermanentAddress({
    Key key,
    @required bool autoValidate,
    @required this.permanentAddrController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController permanentAddrController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: permanentAddrController,
        onFieldSubmitted: (String value) {
          permanentAddrController.text = value;
        },
        validator: (value) => value.isEmpty ? '* required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your permanent address',
          // prefixIcon: Icon(
          //   Icons.format_list_numbered_sharp,
          //   color: Colors.black.withOpacity(0.4),
          // ),
        ),
      ),
    );
  }
}
