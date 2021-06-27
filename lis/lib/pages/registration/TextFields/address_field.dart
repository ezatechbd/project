import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  const AddressField({
    Key key,
    @required bool autoValidate,
    @required this.addressController,
  })  : autoValidate = autoValidate,
        super(key: key);

  final bool autoValidate;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: autoValidate == false ? 55 : 70,
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        // maxLines: 2,
        controller: addressController,
        onFieldSubmitted: (String value) {
          addressController.text = value;
        },
        validator: (value) => value.isEmpty ? 'Address is required' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your address',
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
