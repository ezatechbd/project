import 'package:flutter/material.dart';

class PresentAddress extends StatelessWidget {
  const PresentAddress({
    Key key,
    @required bool autoValidate,
    @required this.presentAddrController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController presentAddrController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: presentAddrController,
        onFieldSubmitted: (String value) {
          presentAddrController.text = value;
        },
        validator: (value) => value.isEmpty ? '* required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your present address',
          // prefixIcon: Icon(
          //   Icons.format_list_numbered_sharp,
          //   color: Colors.black.withOpacity(0.4),
          // ),
        ),
      ),
    );
  }
}
