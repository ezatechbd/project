import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  final Map projectListdropdown;
  static Map mySelection;
  const SelectGender({
    Key key,
    @required this.projectListdropdown,
  }) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
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
        items: widget.projectListdropdown['gender']
            .map<DropdownMenuItem<Map>>((item) {
          return new DropdownMenuItem<Map>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                item["g_name"].toString(),
              ),
            ),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            SelectGender.mySelection = newVal == null ? {} : newVal;
            print(
              SelectGender.mySelection.toString(),
              // SelectGender.mySelection['PROJT_NAME']
              //     .toString(),
            );
          });
        },
        validator: (newVal) => newVal == null ? ' * required' : null,
        value: SelectGender.mySelection,
      ),
    );
  }
}
