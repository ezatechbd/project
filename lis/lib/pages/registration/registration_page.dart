import 'dart:developer';
import 'dart:ui';
import 'package:ati_lis/pages/registration/TextFields/password_field.dart';
import 'package:ati_lis/pages/registration/TextFields/work_place.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_birth_day.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_birth_month.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_birth_year.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_job_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TextFields/address_field.dart';
import 'TextFields/age_field.dart';
import 'TextFields/email_field.dart';
import 'TextFields/mobile-number.dart';
import 'TextFields/name_field.dart';
import 'TextFields/nid_field.dart';
import 'drop_downs/select_department_rank.dart.dart';
import 'drop_downs/select_blood_group.dart';
import 'drop_downs/select_gender.dart';
import 'drop_downs/select_maritial_status.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController workPlaceController = new TextEditingController();
  TextEditingController nidController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool nextPage = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    //change status bar properties
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.red,
      statusBarBrightness: Brightness.dark,
    ));
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textStyle = TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
              'https://i.pinimg.com/originals/10/37/b3/1037b36c15f955da32a0b734d2b13447.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.purpleAccent],
                ),
              ),
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: width * 0.8,
                  height: height * 0.84,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      // ignore: deprecated_member_use
                      autovalidate: _autoValidate,
                      child: !nextPage
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'It’s quick and easy.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                NameField(
                                    autoValidate: _autoValidate,
                                    nameController: nameController),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Birthday',
                                            style: textStyle,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Age',
                                                style: textStyle,
                                              ),
                                              Checkbox(
                                                  value: isChecked,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      isChecked = value;
                                                    });
                                                  }),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    !isChecked
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SelectBirthDay(),
                                              SelectBirthMonth(),
                                              SelectBirthYear(),
                                            ],
                                          )
                                        : AgeField(
                                            autoValidate: _autoValidate,
                                            ageController: ageController),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Text(
                                              'Gender',
                                              style: textStyle,
                                            ),
                                          ),
                                          SelectGender(),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Text(
                                              'Marital Status',
                                              style: textStyle,
                                            ),
                                          ),
                                          SelectMaritialStatus(),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Text(
                                              'Blood Group',
                                              style: textStyle,
                                            ),
                                          ),
                                          SelectBloodGroup(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AddressField(
                                    autoValidate: _autoValidate,
                                    addressController: addressController),
                                MobileNumberField(
                                    autoValidate: _autoValidate,
                                    phoneController: phoneController),
                                EmailField(
                                    autoValidate: _autoValidate,
                                    emailController: emailController),
                                NidField(
                                    autoValidate: _autoValidate,
                                    nidController: nidController),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 89,
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          //log works only if all fields are validate. Fill all the required fields
                                          log(nameController.text);
                                          setState(() {
                                            nextPage = true;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text('Final steps')));
                                          _formKey.currentState.save();
                                        } else {
                                          setState(() {
                                            _autoValidate = true;
                                          });
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Text('Next '),
                                          Icon(Icons.arrow_forward_outlined)
                                        ],
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectDepartmentRank(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5.0, top: 15.0),
                                        child: Text(
                                          'Job Status',
                                          style: textStyle,
                                        ),
                                      ),
                                      SelectJobStatus(),
                                    ],
                                  ),
                                  WorkPlace(
                                      autoValidate: _autoValidate,
                                      workPlaceController: workPlaceController),
                                  PasswordField(
                                      autoValidate: _autoValidate,
                                      passwordController: passwordController),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            nextPage = false;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.arrow_back_outlined),
                                            Text(' Prev'),
                                          ],
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            //log works only if all fields are validate. Fill all the required fields
                                            log(nameController.text);
                                            log(SelectDepartmentRank
                                                .selectedDepartment);
                                            log(SelectDepartmentRank
                                                .selectedRank);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Submitted your records successfully')));
                                            _formKey.currentState.save();
                                          } else {
                                            setState(() {
                                              _autoValidate = true;
                                            });
                                          }
                                        },
                                        child: Text('Submit'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
