import 'package:ati_ams/config/common_const.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreOptions extends StatelessWidget {
  final BuildContext ctxMoreOption;
  const MoreOptions({
    Key key,
    @required this.ctxMoreOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          title: Text('Logout'),
          onTap: () {
            // print('Send email');
            // Navigator.of(ctxMoreOption).pop();
            logOutUser(context);
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.phone),
        //   title: Text('Call phone'),
        //   onTap: () {
        //     print('Call phone');
        //   },
        // ),
      ],
    );
  }
}

//logout user
logOutUser(BuildContext context) {
  CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: 'Do you want to logout?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: cViolet,
      onCancelBtnTap: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      onConfirmBtnTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('email');
        prefs.remove('saveUser');
        await Phoenix.rebirth(context);
      });
}
