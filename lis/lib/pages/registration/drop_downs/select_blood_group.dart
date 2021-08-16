import 'package:flutter/material.dart';

class SelectBloodGroup extends StatefulWidget {
  final Map projectListdropdown;
  static Map mySelection;
  const SelectBloodGroup({
    Key key,
    @required this.projectListdropdown,
  }) : super(key: key);

  @override
  _SelectBloodGroupState createState() => _SelectBloodGroupState();
}

class _SelectBloodGroupState extends State<SelectBloodGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      // padding: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.4)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: DropdownButtonFormField(
        // underline: SizedBox(),
        // searchHint: 'Select Project',
        hint: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Select"),
        ),
        isExpanded: true,
        items: widget.projectListdropdown['blood']
            .map<DropdownMenuItem<Map>>((item) {
          return new DropdownMenuItem<Map>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                item["b_name"].toString(),
              ),
            ),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            SelectBloodGroup.mySelection = newVal == null ? {} : newVal;
            print(
              SelectBloodGroup.mySelection.toString(),
              // SelectBloodGroup.mySelection['PROJT_NAME']
              //     .toString(),
            );
          });
        },
        validator: (newVal) => newVal == null ? ' * required' : null,
        value: SelectBloodGroup.mySelection,
      ),
    );
  }
}
