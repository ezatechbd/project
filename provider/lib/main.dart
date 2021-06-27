import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'eligibility_screen.dart';
import 'eligibility_screen_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: EligibilityScreen(),
        );
      }),
    );
  }
}
