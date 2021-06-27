import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key key,
    @required bool autoValidate,
    @required this.emailController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        onFieldSubmitted: (String value) {
          emailController.text = value;
        },
        validator: (input) =>
            !input.contains('@') ? "Email ID should be valid" : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your email',
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
