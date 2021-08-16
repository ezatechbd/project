import 'package:flutter/material.dart';

class SelectRank extends StatefulWidget {
  final Map projectListdropdown;
  static Map mySelection;
  const SelectRank({
    Key key,
    @required this.projectListdropdown,
  }) : super(key: key);

  @override
  _SelectRankState createState() => _SelectRankState();
}

class _SelectRankState extends State<SelectRank> {
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
            child: Text("Select your rank"),
          ),
          isExpanded: true,
          items: widget.projectListdropdown['rank_details']
              .map<DropdownMenuItem<Map>>((item) {
            return new DropdownMenuItem<Map>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(
                  item["rank_name"].toString(),
                ),
              ),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              SelectRank.mySelection = newVal == null ? {} : newVal;
              print(
                SelectRank.mySelection.toString(),
                // SelectRank.mySelection['PROJT_NAME']
                //     .toString(),
              );
            });
          },
          validator: (newVal) => newVal == null ? ' * required' : null,
          value: SelectRank.mySelection,
        ),
      ),
    );
  }
}
