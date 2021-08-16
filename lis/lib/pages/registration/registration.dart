import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:ati_lis/custom/custom_next_button.dart';
import 'package:ati_lis/model/form_validation_model.dart';
import 'package:ati_lis/pages/login/custom_progress/ProgressHUD.dart';
import 'package:ati_lis/pages/login/login_page.dart';
import 'package:ati_lis/pages/registration/TextFields/present_addr.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_rank.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_religion.dart';
import 'package:ati_lis/pages/registration/radio_button.dart/defense_radio_button.dart';
import 'package:ati_lis/pages/registration/radio_button.dart/service_radio_button.dart';
import 'package:ati_lis/services/form_validation_service.dart';
import 'package:ati_lis/pages/registration/TextFields/work_place.dart';
import 'package:ati_lis/pages/registration/drop_downs/birthday/select_birth_day.dart';
import 'package:ati_lis/pages/registration/drop_downs/birthday/select_birth_month.dart';
import 'package:ati_lis/pages/registration/drop_downs/birthday/select_birth_year.dart';
import 'package:ati_lis/services/registration_service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telephony/telephony.dart';
import 'TextFields/email_field.dart';
import 'TextFields/mobile-number.dart';
import 'TextFields/name_field.dart';
import 'TextFields/nid_field.dart';
import 'TextFields/permanent_addr.dart';
import 'TextFields/personal_id.dart';
import 'drop_downs/age/select_age_day.dart';
import 'drop_downs/age/select_age_month.dart';
import 'drop_downs/age/select_age_year.dart';
import 'drop_downs/select_blood_group.dart';
import 'drop_downs/select_gender.dart';
import 'drop_downs/select_maritial_status.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController workPlaceController = new TextEditingController();
  TextEditingController nidController = new TextEditingController();
  TextEditingController pIDController = new TextEditingController();
  TextEditingController presentAddrController = new TextEditingController();
  TextEditingController permanentAddrController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool isApiCallProcess = false;
  bool nextPage1 = false;
  bool nextPage2 = false;
  bool nextPage3 = false;
  bool nextPage4 = false;
  bool isChecked = false;
  var isLoading = true;
  final Telephony telephony = Telephony.instance;

  FormValidation formData = new FormValidation();
  //form validation from backend
  // List<FormValidation> formData = [];
  List<PrcObjTest> checkUserName = [];
  List<PrcObjTest> checkAge = [];
  List<PrcObjTest> checkBirthDay = [];
  List<PrcObjTest> checkBirthMonth = [];
  List<PrcObjTest> checkBirthYear = [];
  List<PrcObjTest> checkAddress = [];
  List<PrcObjTest> checkPassword = [];
  List<PrcObjTest> checkNID = [];
  List<PrcObjTest> checkDepartment = [];
  List<PrcObjTest> checkRank = [];
  List<PrcObjTest> checkJobStatus = [];
  List<PrcObjTest> checkWorkPlace = [];
  List<PrcObjTest> checkEmail = [];
  List<PrcObjTest> checkGender = [];
  List<PrcObjTest> checkMaritialStatus = [];
  List<PrcObjTest> checkBloodGroup = [];
  List<PrcObjTest> checkMobileNo = [];
  Map ticketListdropdown;
  List rankList = [];
  List rankListVal = [];
  Map rankDetailsDropDown;

  serviceMethod() async {
    var url = "http://192.168.0.95:8088/ords/ordstest/cmh/fget/";
    final response = await http.get(url);
    // final responseJson = json.decode(response.body);
    // print(responseJson);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        ticketListdropdown = json.decode(response.body)['items'][0];
        rankList = json.decode(response.body)['items'][0]['emp_category'];
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load internet');
    }
  }

  filterRankList(String id) {
    rankListVal = rankList.where((value) => value['n_id'] == id).toList();
    rankDetailsDropDown = rankListVal[0];
    print(rankDetailsDropDown);
  }

  @override
  void initState() {
    FormValidationService().fetchFormData().then((data) {
      setState(() {
        formData = data;
        checkFormFields();
      });
    }).then((value) {
      serviceMethod();
    });
    super.initState();
  }

  //filter by column name
  checkFormFields() {
    checkUserName = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_name')
        .toList();
    checkAge = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_age')
        .toList();
    checkBirthDay = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_birth_day')
        .toList();
    checkBirthMonth = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_birth_month')
        .toList();
    checkBirthYear = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_birth_year')
        .toList();
    checkAddress = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_address')
        .toList();
    checkPassword = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_password')
        .toList();
    checkNID = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_nid')
        .toList();
    checkDepartment = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_department')
        .toList();
    checkRank = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_rank')
        .toList();
    checkJobStatus = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_job_status')
        .toList();
    checkWorkPlace = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_workspace')
        .toList();
    checkEmail = formData.prcObjTest
        .where((value) => value.tcolmName == 'user_email')
        .toList();
    checkGender = formData.prcObjTest
        .where((value) => value.tcolmName == 'gender')
        .toList();
    checkMaritialStatus = formData.prcObjTest
        .where((value) => value.tcolmName == 'marital_status')
        .toList();
    checkBloodGroup = formData.prcObjTest
        .where((value) => value.tcolmName == 'blood_group')
        .toList();
    checkMobileNo = formData.prcObjTest
        .where((value) => value.tcolmName == 'mobile_no')
        .toList();
  }

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
        body: ProgressHUD(
            inAsyncCall: isApiCallProcess,
            opacity: 0.3,
            child: Stack(
              children: <Widget>[
                ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: Image.network(
                        'https://i.pinimg.com/originals/10/37/b3/1037b36c15f955da32a0b734d2b13447.jpg',
                        fit: BoxFit.cover)),
                Opacity(
                    opacity: 0.3,
                    child: Container(
                        decoration: new BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.blue, Colors.purpleAccent])))),
                Center(
                    child: ClipRect(
                        child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                    width: width * 0.95,
                                    height: height * 0.92,
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200
                                            .withOpacity(0.5)),
                                    child: isLoading
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : SingleChildScrollView(
                                            child: Form(
                                                key: _formKey,
                                                // ignore: deprecated_member_use
                                                autovalidate: _autoValidate,
                                                child: !nextPage1
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                            Text('Sign Up',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Text(
                                                                'It’s quick and easy.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.6))),
                                                            checkUserName[0]
                                                                        .tblcolvFg
                                                                        .toString() ==
                                                                    '1'
                                                                ? NameField(
                                                                    autoValidate:
                                                                        _autoValidate,
                                                                    nameController:
                                                                        nameController)
                                                                : Container(),
                                                            checkAge[0]
                                                                        .tblcolvFg
                                                                        .toString() ==
                                                                    '1'
                                                                ? Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                        Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 8.0),
                                                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                              Text(!isChecked ? 'Birthday' : 'Age', style: textStyle),
                                                                              Row(children: [
                                                                                Text('Age', style: textStyle),
                                                                                Checkbox(
                                                                                    value: isChecked,
                                                                                    onChanged: (value) {
                                                                                      setState(() {
                                                                                        isChecked = value;
                                                                                      });
                                                                                    })
                                                                              ])
                                                                            ])),
                                                                        !isChecked
                                                                            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                SelectBirthDay(),
                                                                                SelectBirthMonth(),
                                                                                SelectBirthYear(),
                                                                              ])
                                                                            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                SelectAgeYear(),
                                                                                SelectAgeMonth(),
                                                                                SelectAgeDay(),
                                                                              ])
                                                                      ])
                                                                : Container(),
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10.0),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      checkGender[0].tblcolvFg.toString() ==
                                                                              '1'
                                                                          ? Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                  Padding(padding: const EdgeInsets.only(bottom: 5.0), child: Text('Gender', style: textStyle)),
                                                                                  SelectGender(projectListdropdown: ticketListdropdown),
                                                                                ])
                                                                          : Container(),
                                                                      checkMaritialStatus[0].tblcolvFg.toString() ==
                                                                              '1'
                                                                          ? Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                  Padding(padding: const EdgeInsets.only(bottom: 5.0), child: Text('Marital Status', style: textStyle)),
                                                                                  SelectMaritialStatus(projectListdropdown: ticketListdropdown)
                                                                                ])
                                                                          : Container(),
                                                                      checkBloodGroup[0].tblcolvFg.toString() ==
                                                                              '1'
                                                                          ? Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                  Padding(padding: const EdgeInsets.only(bottom: 5.0), child: Text('Blood Group', style: textStyle)),
                                                                                  SelectBloodGroup(projectListdropdown: ticketListdropdown)
                                                                                ])
                                                                          : Container()
                                                                    ])),
                                                            checkMobileNo[0]
                                                                        .tblcolvFg
                                                                        .toString() ==
                                                                    '1'
                                                                ? MobileNumberField(
                                                                    autoValidate:
                                                                        _autoValidate,
                                                                    phoneController:
                                                                        phoneController)
                                                                : Container(),
                                                            checkEmail[
                                                                            0]
                                                                        .tblcolvFg
                                                                        .toString() ==
                                                                    '1'
                                                                ? EmailField(
                                                                    autoValidate:
                                                                        _autoValidate,
                                                                    emailController:
                                                                        emailController)
                                                                : Container(),
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child:
                                                                    Container(
                                                                        width:
                                                                            89,
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                8.0),
                                                                        child: CustomNextButton(onTap:
                                                                            () {
                                                                          if (_formKey
                                                                              .currentState
                                                                              .validate()) {
                                                                            //log works only if all fields are validate. Fill all the required fields
                                                                            log(nameController.text);
                                                                            setState(() {
                                                                              nextPage1 = true;
                                                                            });
                                                                            _formKey.currentState.save();
                                                                          } else {
                                                                            setState(() {
                                                                              _autoValidate = true;
                                                                            });
                                                                          }
                                                                        })))
                                                          ])
                                                    : !nextPage2
                                                        ? Column(children: [
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child:
                                                                    IconButton(
                                                                        icon: Icon(Icons
                                                                            .arrow_back),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            nextPage1 =
                                                                                false;
                                                                          });
                                                                        })),
                                                            Container(
                                                                height: height *
                                                                    0.75,
                                                                child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      DefenseRadioButton(
                                                                          onTap:
                                                                              () {
                                                                        setState(
                                                                            () {
                                                                          nextPage2 =
                                                                              true;
                                                                        });
                                                                      }),
                                                                    ]))
                                                          ])
                                                        : !nextPage3
                                                            ? Column(children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: IconButton(
                                                                        icon: Icon(Icons.arrow_back),
                                                                        onPressed: () {
                                                                          setState(
                                                                              () {
                                                                            nextPage2 =
                                                                                false;
                                                                          });
                                                                        })),
                                                                Container(
                                                                    height:
                                                                        height *
                                                                            0.75,
                                                                    child: Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          ServiceRadioButton(onTap:
                                                                              () {
                                                                            setState(() {
                                                                              nextPage3 = true;
                                                                            });
                                                                          })
                                                                        ]))
                                                              ])
                                                            : !nextPage4
                                                                ? Column(
                                                                    children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child: IconButton(
                                                                                icon: Icon(Icons.arrow_back),
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    nextPage3 = false;
                                                                                  });
                                                                                })),
                                                                        Container(
                                                                            height: height *
                                                                                0.75,
                                                                            child:
                                                                                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(bottom: 20.0),
                                                                                child: PersonalID(autoValidate: _autoValidate, pIDController: pIDController),
                                                                              ),
                                                                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                Container(),
                                                                                CustomNextButton(onTap: () {
                                                                                  setState(() {
                                                                                    SelectRank.mySelection = null; //resetting dropdown selection value
                                                                                    if (_formKey.currentState.validate()) {
                                                                                      log(nameController.text);
                                                                                      setState(() {
                                                                                        filterRankList(pIDController.text.toUpperCase());
                                                                                        nextPage4 = true;
                                                                                      });
                                                                                      _formKey.currentState.save();
                                                                                    } else {
                                                                                      setState(() {
                                                                                        _autoValidate = true;
                                                                                      });
                                                                                    }
                                                                                  });
                                                                                })
                                                                              ])
                                                                            ]))
                                                                      ])
                                                                : Column(
                                                                    children: [
                                                                      Align(
                                                                          alignment:
                                                                              Alignment.topLeft,
                                                                          child: IconButton(
                                                                              icon: Icon(Icons.arrow_back),
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  nextPage4 = false;
                                                                                });
                                                                              })),
                                                                      Container(
                                                                          height:
                                                                              height * 0.75,
                                                                          child: SingleChildScrollView(
                                                                              child: Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              checkDepartment[0].tblcolvFg.toString() == '1' ? SelectRank(projectListdropdown: rankDetailsDropDown) : Container(),
                                                                              checkWorkPlace[0].tblcolvFg.toString() == '1' ? WorkPlace(autoValidate: _autoValidate, workPlaceController: workPlaceController) : Container(),
                                                                              checkNID[0].tblcolvFg.toString() == '1' ? NidField(autoValidate: _autoValidate, nidController: nidController) : Container(),
                                                                              SelectReligion(projectListdropdown: ticketListdropdown),
                                                                              PresentAddress(autoValidate: _autoValidate, presentAddrController: presentAddrController),
                                                                              PermanentAddress(autoValidate: _autoValidate, permanentAddrController: permanentAddrController),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(),
                                                                                  ElevatedButton(
                                                                                      onPressed: () {
                                                                                        if (_formKey.currentState.validate()) {
                                                                                          setState(() {
                                                                                            isApiCallProcess = true;
                                                                                          });
                                                                                          String birthDate = '${SelectBirthDay.dropdownValue}/${SelectBirthMonth.dropdownValue}/${SelectBirthYear.dropdownValue}';
                                                                                          String birthDateVal = '';
                                                                                          isChecked == false ? birthDateVal = birthDate : birthDateVal = '';
                                                                                          int ageDay = isChecked ? int.parse(SelectAgeDay.dropdownValue) : 0;
                                                                                          int ageMonth = isChecked ? int.parse(SelectAgeMonth.dropdownValue) : 0;
                                                                                          int ageYear = isChecked ? int.parse(SelectAgeYear.dropdownValue) : 0;
                                                                                          sumbitRegistrationData(
                                                                                            nameController.text,
                                                                                            nidController.text,
                                                                                            phoneController.text,
                                                                                            emailController.text,
                                                                                            presentAddrController.text,
                                                                                            permanentAddrController.text,
                                                                                            SelectGender.mySelection['g_id'].toString(),
                                                                                            SelectReligion.mySelection['r_id'].toString(),
                                                                                            SelectMaritialStatus.mySelection['m_id'].toString(),
                                                                                            SelectBloodGroup.mySelection['b_id'].toString(),
                                                                                            birthDateVal,
                                                                                            ageDay,
                                                                                            ageMonth,
                                                                                            ageYear,
                                                                                            ServiceRadioButton.groupValue,
                                                                                            workPlaceController.text,
                                                                                            SelectRank.mySelection['rank_id'].toString(),
                                                                                          ).then((value) {
                                                                                            log(statusCode.toString());
                                                                                            if (statusCode == 200) {
                                                                                              setState(() {
                                                                                                isApiCallProcess = false;
                                                                                              });
                                                                                              telephony.sendSms(to: "${phoneController.text}", message: "Welcome! Your registration is sucessful!");
                                                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                                                                              CoolAlert.show(
                                                                                                context: context,
                                                                                                width: 350,
                                                                                                type: CoolAlertType.success,
                                                                                                text: "Registration successful!",
                                                                                              );
                                                                                            } else {
                                                                                              setState(() {
                                                                                                isApiCallProcess = false;
                                                                                              });
                                                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                content: Text('Registration failed! Please Submit again'),
                                                                                              ));
                                                                                            }
                                                                                          });
                                                                                          _formKey.currentState.save();
                                                                                        } else {
                                                                                          setState(() {
                                                                                            _autoValidate = true;
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      child: Text('Submit'),
                                                                                      style: ButtonStyle(
                                                                                        backgroundColor: MaterialStateProperty.all(Colors.green),
                                                                                      ))
                                                                                ],
                                                                              )
                                                                            ],
                                                                          )))
                                                                    ],
                                                                  ))))))))
              ],
            )));
  }
}
