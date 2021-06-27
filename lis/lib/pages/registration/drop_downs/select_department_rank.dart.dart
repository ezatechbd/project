import 'package:flutter/material.dart';

class SelectDepartmentRank extends StatefulWidget {
  static String selectedDepartment;
  static String selectedRank;
  @override
  _SelectDepartmentRankState createState() => _SelectDepartmentRankState();
}

class _SelectDepartmentRankState extends State<SelectDepartmentRank> {
  List<String> department = ['Army', 'Air Force', 'Navy'];
  List<String> armyRank = [
    'Field Marshal',
    'General',
    'Lieutenant General',
    'Major General',
    'Brigadier General',
    'Colonel',
    'Lieutenant Colonel',
    'Major',
    'Captain',
    'Lieutenant',
    'Sub Lieutenant',
    'Master Warrant Officer',
    'Senior Warrant Officer',
    'Warrant Officer',
    'Sergeant',
    'Corporal',
    'Lance Corporal',
    'Sainik',
  ];
  List<String> airForceRank = [
    'Marshal of the Air Force',
    'Air Chief Marshal',
    'Air Marshal',
    'Air Vice Marshal',
    'Air Commodore',
    'Group Captain',
    'Wing Commander',
    'Squadron Leader',
    'Flight Lieutenant',
    'Flying Officer',
    'Pilot Officer',
    'Master Warrant Officer',
    'Senior Warrant Officer',
    'Warrant Officer',
    'Sergeant',
    'Corporal',
    'Leading Aircraftman',
    'Aircraftman',
  ];
  List<String> navyRank = [
    'Admiral of the Fleet',
    'Admiral',
    'Vice Admiral',
    'Rear Admiral',
    'Commodore',
    'Captain',
    'Commander',
    'Lieutenant Commander',
    'Lieutenant',
    'Sub Lieutenant',
    'Acting Sub Lieutenant',
    'Master Chief Petty Officer',
    'Senior Chief Petty Officer',
    'Chief Petty Officer',
    'Petty Officer',
    'Leading Seaman',
    'Able Seaman',
    'Seaman',
  ];

  List<String> rank = [];

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Department Dropdown
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            'Department',
            style: textStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.4)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonFormField<String>(
            hint: Text('Select'),
            value: SelectDepartmentRank.selectedDepartment,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 30, //this inicrease the size
            elevation: 16,
            style: TextStyle(color: Colors.black),
            // underline: Container(),
            validator: (newVal) => newVal == null ? 'required' : null,
            items: department.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (department) {
              if (department == 'Army') {
                rank = armyRank;
              } else if (department == 'Air Force') {
                rank = airForceRank;
              } else if (department == 'Navy') {
                rank = navyRank;
              } else {
                rank = [];
              }
              setState(() {
                SelectDepartmentRank.selectedRank = null;
                SelectDepartmentRank.selectedDepartment = department;
              });
            },
          ),
        ),
        // Department Dropdown Ends here

        // Rank Dropdown
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, top: 15.0),
          child: Text(
            'Rank',
            style: textStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.4)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonFormField<String>(
            hint: Text('Select'),
            value: SelectDepartmentRank.selectedRank,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 30, //this inicrease the size
            elevation: 16,
            style: TextStyle(color: Colors.black),
            // underline: Container(),
            validator: (newVal) => newVal == null ? 'required' : null,
            items: rank.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (rank) {
              setState(() {
                SelectDepartmentRank.selectedRank = rank;
              });
            },
          ),
        ),
        // Rank Dropdown Ends here
      ],
    );
  }
}
