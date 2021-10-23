import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/profile_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map apiResp = {};
  bool isLoading = true;
  @override
  void initState() {
    getRespFromSP().then((data) {
      setState(() {
        apiResp = data['data']['user_info'];
        isLoading = false;
      });
    });
    super.initState();
  }

  Future getRespFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiResp = json.decode(prefs.getString('apiresp'));
    return apiResp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaf4ff),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProfileTile(
              imageUrl:
                  'https://enamulhaque028.github.io/profile/img/profile.jpg',
              name: apiResp['students_name'].toString(),
              department: 'Dept. of ${apiResp['department'].toString()}',
              id: apiResp['stu_id'].toString(),
              session: apiResp['session_years'].toString(),
              batchNo: apiResp['batch_no'].toString(),
              courseType: apiResp['course_type'].toString(),
              courseName: apiResp['course_name'].toString(),
              gender: apiResp['gender'].toString(),
              dateOfBirth: apiResp['date_of_birth']
                  .toString()
                  .split('00:00:00')[0]
                  .toString(),
            ),
    );
  }
}


// ProfileTile(
//         imageUrl: 'https://enamulhaque028.github.io/profile/img/profile.jpg',
//         name: 'MD Enamul Haque',
//         department: 'Dept. of Cardiology',
//         id: '01-MSOG-220002',
//         session: '2022',
//         batchNo: '1st',
//         courseType: 'MS',
//         courseName: 'Obstetrics & Gynecology',
//         gender: 'Male',
//         dateOfBirth: '8-Oct-1996',
//       ),