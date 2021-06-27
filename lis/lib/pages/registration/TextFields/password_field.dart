import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key key,
    @required bool autoValidate,
    @required this.passwordController,
  })  : _autoValidate = autoValidate,
        super(key: key);

  final bool _autoValidate;
  final TextEditingController passwordController;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: widget.passwordController,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (String value) {
          widget.passwordController.text = value;
        },
        validator: (input) => input.length < 6
            ? "Password should be at least 6 characters"
            : null,
        obscureText: hidePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'New password',
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black.withOpacity(0.4),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            color: Colors.black.withOpacity(0.4),
            icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ),
    );
  }
}
