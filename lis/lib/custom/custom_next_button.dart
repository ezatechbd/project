import 'package:flutter/material.dart';

class CustomNextButton extends StatelessWidget {
  final Function onTap;

  const CustomNextButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        children: [Text('Next '), Icon(Icons.arrow_forward_outlined)],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
    );
  }
}
