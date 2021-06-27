import 'package:ati_lis/custom/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/custom/user_info.dart';
import 'package:ati_lis/pages/profile/flip_card/flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _nameController = TextEditingController();
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    _nameController.text =
        "MD. Enamul Haque"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(
          top: statusBarHeight,
          //left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: cViolet,
                  ),
                ),
              ],
            ),
            FlipCard(
              name: _nameController.text,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomTimeLine(height: 50),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              flex: 15,
                              child: !isEditable
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          _nameController.text,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    )
                                  : TextFormField(
                                      controller: _nameController,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (value) {
                                        print('Name Changed!');
                                        setState(() {
                                          isEditable = false;
                                          _nameController.text = value;
                                        });
                                      })),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.edit,
                                size: 15,
                              ),
                              onPressed: () {
                                setState(() {
                                  isEditable = true;
                                });
                              })
                        ],
                      ),
                      UserInfo(
                        title: 'Phone No.',
                        info: '+8801843498350',
                      ),
                      UserInfo(
                        title: 'Personal No.',
                        info: 'BA-6778',
                      ),
                      UserInfo(
                        title: 'Email Address',
                        info: 'enamulhaque028@gmail.com',
                      ),
                      UserInfo(
                        title: 'Blood Group',
                        info: 'B+',
                      ),
                      UserInfo(
                        title: 'Gender',
                        info: 'Male',
                      ),
                      UserInfo(
                        title: 'Date of Birth',
                        info: 'Oct 08, 1996',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
