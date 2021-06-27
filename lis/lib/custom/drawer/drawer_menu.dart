import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/custom/drawer/side_menu.dart';
import 'package:ati_lis/pages/home/home_page.dart';
import 'package:ati_lis/pages/login/login_page.dart';
import 'package:ati_lis/pages/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.68,
      //width: 250,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          cViolet,
                          cSky,
                        ],
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomListTile(
                    icon: Icons.home,
                    text: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyHomePage(),
                        ),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: Icons.account_circle,
                    text: 'Profile',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserProfile(),
                        ),
                      );
                    },
                  ),
                  CustomListTile(
                    icon: FontAwesomeIcons.signOutAlt,
                    text: 'Logout',
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('email');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext ctx) => LoginPage(),
                        ),
                      );
                      //Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Developed by'),
                  Image.asset(
                    'assets/images/ati.png',
                    height: width * 0.07,
                    //width: width * 0.20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
