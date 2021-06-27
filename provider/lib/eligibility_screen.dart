import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/child_page2.dart';
import 'package:provider_state/eligibility_screen_provider.dart';

class EligibilityScreen extends StatelessWidget {
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(child: Consumer<EligibilityScreenProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        provider.isEligible ? Colors.green : Colors.redAccent,
                  ),
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: 'Enter age',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    int age = int.parse(ageController.text.trim());
                    provider.checkEligibility(age);
                  },
                  child: Text('check'),
                ),
                Text(provider.message),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildPage2(),
                      ),
                    );
                  },
                  child: Text('next'),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
