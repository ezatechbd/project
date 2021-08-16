import 'dart:developer';
import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/custom/button.dart';
import 'package:ati_lis/model/login_model.dart';
import 'package:ati_lis/pages/home/home_page.dart';
import 'package:ati_lis/pages/otp_verification/otp_verification.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_blood_group.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_gender.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_maritial_status.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_rank.dart';
import 'package:ati_lis/pages/registration/drop_downs/select_religion.dart';
import 'package:ati_lis/pages/registration/registration.dart';
import 'package:ati_lis/services/local_auth_api.dart';
import 'package:ati_lis/services/login_api_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Animation/FadeAnimation.dart';
import 'custom_progress/ProgressHUD.dart';
import 'package:device_info/device_info.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  Color loginColor = cViolet;
  //Color loginColor = Color.fromRGBO(0, 128, 128, 1);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool hasFingerPrint;
  bool isChecked = false;
  String email;
  String otp;
  String workPlace;
  String phoneModel;
  String osVersion;

  @override
  void initState() {
    checkFingerPrint();
    super.initState();
    loginRequestModel = new LoginRequestModel();
    getFirebaseToken();
    getDeviceInfo();
    getSharedPreferenceKey();
  }

  checkFingerPrint() async {
    final biometrics = await LocalAuthApi.getBiometrics();
    setState(() {
      hasFingerPrint = biometrics.contains(BiometricType.fingerprint);
    });
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    phoneModel = androidInfo.model.toString();
    osVersion =
        '${androidInfo.version.sdkInt} (${androidInfo.version.release})';
    log('phoneModel: $phoneModel  osVersion: $osVersion');
  }

  getSharedPreferenceKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email').toString();
    otp = prefs.getString('otp').toString();
    workPlace = prefs.getString('workPlace').toString();
    print('email: $email otp: $otp, workplace: $workPlace');
  }

  getFirebaseToken() async {
    String token = await FirebaseMessaging.instance.getToken();
    log('Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.red,
      statusBarBrightness: Brightness.dark,
    ));
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: new BoxDecoration(
          //     image: new DecorationImage(
          //         image: AssetImage('assets/images/login_background.jpg'),
          //         fit: BoxFit.fill),
          //   ),
          // ),
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.fill),
            ),
          ),
          // Opacity(
          //   opacity: 0.3,
          //   child: Container(
          //     decoration: new BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [
          //           Colors.purpleAccent,
          //           Colors.white,
          //           Colors.white,
          //           Colors.white,
          //           Colors.purpleAccent
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   //left: width * 0.09,
          //   width: width * 0.40,
          //   height: height * 0.32,
          //   child: FadeAnimation(
          //     1.2,
          //     Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('assets/images/st2.png'),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: width * 0.15,
          //   width: width * 0.70,
          //   height: height * 0.50,
          //   top: -height * 0.05,
          //   child: FadeAnimation(
          //     1.5,
          //     Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('assets/images/br.png'),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            //left: width * 0.09,
            top: height * 0.08,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CMH',
                    style: TextStyle(
                      fontSize: 40,
                      color: cViolet,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      workPlace.toString() == 'null'
                          ? ''
                          : workPlace.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: cViolet.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: width * 0.10,
            // top: height * 0.05,
            width: width * 0.22,
            height: height * 0.25,
            child: FadeAnimation(
              1.7,
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.03,
            bottom: height * 0.06,
            child: FadeAnimation(
                3.7,
                Text(
                  'Developed by',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
          ),
          Positioned(
            left: width * 0.03,
            top: height * 0.85,
            width: width * 0.30,
            height: height * 0.25,
            child: FadeAnimation(
              3.7,
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ati.png'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Container(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FadeAnimation(
                          2.5,
                          Container(
                            child: Center(
                              // child: Image.asset(
                              //   'assets/images/meditop.png',
                              //   height: 55,
                              // ),
                              child: Text(
                                'ATI MEDITOP',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: cViolet,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2.7,
                          Padding(
                            padding: EdgeInsets.only(
                                left: 30.0,
                                right: 30.0,
                                top: 10.0,
                                bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: loginColor.withOpacity(0.3),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10),
                                  )
                                ],
                              ),
                              child: Form(
                                key: globalFormKey,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(7.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey[100],
                                          ),
                                        ),
                                      ),
                                      child: new TextFormField(
                                        scrollPadding:
                                            EdgeInsets.all(height * 0.26),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onSaved: (input) =>
                                            loginRequestModel.email = input,
                                        validator: (input) =>
                                            !input.contains('@')
                                                ? "Email Id should be valid"
                                                : null,
                                        decoration: new InputDecoration(
                                          hintText: "Email Address",
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  loginColor.withOpacity(0.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: loginColor,
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: loginColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(7.0),
                                      child: new TextFormField(
                                        scrollPadding:
                                            EdgeInsets.all(height * 0.41),
                                        //style: TextStyle(color: loginColor),
                                        keyboardType: TextInputType.text,
                                        onSaved: (input) =>
                                            loginRequestModel.password = input,
                                        validator: (input) => input.length < 6
                                            ? "Password should be at least 6 characters"
                                            : null,
                                        obscureText: hidePassword,
                                        decoration: new InputDecoration(
                                          hintText: "Password",
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  loginColor.withOpacity(0.2),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: loginColor),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: loginColor,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                hidePassword = !hidePassword;
                                              });
                                            },
                                            color: loginColor.withOpacity(0.4),
                                            icon: Icon(hidePassword
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          3.0,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  child: CustomButton(
                                    btnText: "Login",
                                    btnColor: loginColor,
                                    onTap: () {
                                      if (validateAndSave()) {
                                        print(loginRequestModel.toJson());

                                        setState(() {
                                          isApiCallProcess = true;
                                        });

                                        APIService apiService =
                                            new APIService();
                                        apiService
                                            .login(loginRequestModel)
                                            .then((value) async {
                                          if (value.toString().isNotEmpty &&
                                              value != null) {
                                            setState(() {
                                              isApiCallProcess = false;
                                            });
                                            //String userPhoto = value['user_photo'];
                                            String workPlace = 'Barishal';
                                            String userCode = value['details']
                                                    ['SAUSERS_ID']
                                                .toString();
                                            String clientsId = value['details']
                                                    ['CLIENTS_ID']
                                                .toString();
                                            String userName = value['details']
                                                    ['USRS_FNAME']
                                                .toString();
                                            //print(LoginPage.userCode);

                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString(
                                                'workPlace', workPlace);
                                            prefs.setString(
                                                'userCode', userCode);
                                            prefs.setString(
                                                'clientsId', clientsId);
                                            prefs.setString(
                                                'userName', userName);

                                            //.......start of comparing version code wih P_MAVERCODE
                                            PackageInfo packageInfo =
                                                await PackageInfo
                                                    .fromPlatform();
                                            int versionCode = int.parse(
                                                packageInfo.buildNumber);
                                            print('version code: $versionCode');
                                            int pMaverCode = int.parse(
                                                value['user_details']
                                                    ['P_MAVERCODE']);
                                            print('P_MAVERCODE: $pMaverCode');

                                            if (pMaverCode == 40) {
                                              //use this in upper if condition "versionCode == pMaverCode"
                                              prefs.setString('email',
                                                  'useremail@gmail.com');
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext ctx) =>
                                                      otp.toString() == 'null'
                                                          ? OTPVerification(
                                                              navigateWidget:
                                                                  MyHomePage())
                                                          : MyHomePage(),
                                                ),
                                              );
                                            } else if (pMaverCode >
                                                versionCode) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: const Text(
                                                      'Please update the app!'),
                                                ),
                                              );
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                            } else if (pMaverCode <
                                                    versionCode ||
                                                pMaverCode == null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: const Text(
                                                      'maintenance break. Please wait!'),
                                                ),
                                              );
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                            }
                                            //.......end of comparing version code wih P_MAVERCODE

                                          } else {
                                            setState(() {
                                              isApiCallProcess = false;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(
                                                    'Invalid email/password or connectivity problem!'),
                                              ),
                                            );
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          }
                                        });
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      Text('Remember me'),
                                      Checkbox(
                                        value: isChecked,
                                        onChanged: (value) async {
                                          setState(() {
                                            isChecked = value;
                                          });
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          isChecked
                                              ? prefs.setString(
                                                  'saveUser', 'saved')
                                              : prefs.remove('saveUser');
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        hasFingerPrint == true
                            ? (email.toString() == 'null' ||
                                    otp.toString() == 'null')
                                ? Container()
                                : FadeAnimation(
                                    3.3,
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width: 180,
                                        child: CustomButton(
                                            btnColor: loginColor,
                                            btnText: 'Fingerprint\nLogin',
                                            onTap: () async {
                                              print(email.toString());
                                              final isAuthenticated =
                                                  await LocalAuthApi
                                                      .authenticate();
                                              if (isAuthenticated) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePage()),
                                                );
                                              }
                                            }),
                                      ),
                                    ),
                                  )
                            : Container(),
                        (email.toString() == 'null' || otp.toString() == 'null')
                            ? FadeAnimation(
                                3.5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(''),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 30.0, top: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Need an account?',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         OTPVerification(
                                              //             navigateWidget:
                                              //                 RegistrationPage()),
                                              //     // TestRegistration(),
                                              //   ),
                                              // );

                                              //resetting dropdown selection value
                                              SelectGender.mySelection = null;
                                              SelectMaritialStatus.mySelection =
                                                  null;
                                              SelectBloodGroup.mySelection =
                                                  null;
                                              SelectRank.mySelection = null;
                                              SelectReligion.mySelection = null;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationPage(),
                                                  // TestRegistration(),
                                                ),
                                              );
                                            },
                                            child: Text('Sign Up'),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
