import 'package:flutter/material.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField({
    Key key,
    @required bool autoValidate,
    @required this.phoneController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: _autoValidate == false ? 55 : 70,
        padding: EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          onFieldSubmitted: (String value) {
            phoneController.text = value;
          },
          validator: (input) =>
              input.length < 11 ? "Phone no. should be 11 characters" : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your mobile number',
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
