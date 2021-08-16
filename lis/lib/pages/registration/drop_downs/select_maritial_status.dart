import 'package:flutter/material.dart';

class SelectMaritialStatus extends StatefulWidget {
  final Map projectListdropdown;
  static Map mySelection;
  const SelectMaritialStatus({
    Key key,
    @required this.projectListdropdown,
  }) : super(key: key);

  @override
  _SelectMaritialStatusState createState() => _SelectMaritialStatusState();
}

class _SelectMaritialStatusState extends State<SelectMaritialStatus> {
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
        items: widget.projectListdropdown['marital']
            .map<DropdownMenuItem<Map>>((item) {
          return new DropdownMenuItem<Map>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                item["m_name"].toString(),
              ),
            ),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            SelectMaritialStatus.mySelection = newVal == null ? {} : newVal;
            print(
              SelectMaritialStatus.mySelection.toString(),
              // SelectMaritialStatus.mySelection['PROJT_NAME']
              //     .toString(),
            );
          });
        },
        validator: (newVal) => newVal == null ? ' * required' : null,
        value: SelectMaritialStatus.mySelection,
      ),
    );
  }
}
