import 'package:flutter/material.dart';

class SelectReligion extends StatefulWidget {
  final Map projectListdropdown;
  static Map mySelection;
  const SelectReligion({
    Key key,
    @required this.projectListdropdown,
  }) : super(key: key);

  @override
  _SelectReligionState createState() => _SelectReligionState();
}

class _SelectReligionState extends State<SelectReligion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.4)),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButtonFormField(
          // underline: SizedBox(),
          // searchHint: 'Select Project',
          hint: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Select Religion"),
          ),
          isExpanded: true,
          items: widget.projectListdropdown['religion']
              .map<DropdownMenuItem<Map>>((item) {
            return new DropdownMenuItem<Map>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  item["r_name"].toString(),
                ),
              ),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              SelectReligion.mySelection = newVal == null ? {} : newVal;
              print(
                SelectReligion.mySelection.toString(),
                // SelectReligion.mySelection['PROJT_NAME']
                //     .toString(),
              );
            });
          },
          validator: (newVal) => newVal == null ? ' * required' : null,
          value: SelectReligion.mySelection,
        ),
      ),
    );
  }
}
