import 'package:flutter/material.dart';
import 'dart:ui';

class FrontView extends StatelessWidget {
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: 260,
          width: width,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(20),
          ),
        ),
        Container(
          height: 220,
          width: width,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black38,
          ),
          //color: Colors.black26,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            height: 42,
            child: Image.asset('assets/images/meditop.png'),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://enamulhaque028.github.io/profile/img/profile.jpg'),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 20,
          child: Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Powered by',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 20,
          child: Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'ATI Limited',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          right: 20,
          child: Container(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              'Welcome to ATI MEDITOP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 170,
          left: 20,
          child: Container(
            padding: EdgeInsets.only(left: 8.0),
            child: RichText(
              text: TextSpan(
                text: 'INTEGRITY | ',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'RESPONSIBILITY | ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'ACCOUNTABILITY',
                    style: TextStyle(
                      color: Colors.yellow[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
