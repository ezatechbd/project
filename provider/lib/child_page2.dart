import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'eligibility_screen_provider.dart';

class ChildPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<EligibilityScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(providerData.message),
              ElevatedButton(
                onPressed: () {
                  providerData.checkEligibility(19);
                },
                child: Text('data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
