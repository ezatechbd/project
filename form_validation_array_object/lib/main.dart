import 'dart:developer';
import 'package:flutter/material.dart';
import 'model.dart';
import 'services.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PrcObjTest> formData = [];
  List<PrcObjTest> checkUserName = [];

  var isLoading = true;
  FormValidation blogPost = new FormValidation();

  @override
  void initState() {
    Webservice().fetchPosts().then((data) {
      setState(() {
        blogPost = data;
        isLoading = false;
        getUserNameList();
        //filter column for 'user_name'
        checkUserName = blogPost.prcObjTest
            .where((value) => value.tcolmName == 'user_name')
            .toList();
      });
      // log(checkUserAge[0].iSEnable.toString());
      log(blogPost.prcObjTest[0].comentTxt.toString());
      log(checkUserName[0].tcolmName.toString());
      print(checkUserName.length);
    });
    super.initState();
  }

  getUserNameList() {
    for (int i = 0; i < blogPost.prcObjTest.length; i++) {
      formData.add(blogPost.prcObjTest[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: blogPost.prcObjTest.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(0.5), //random color for each child
                  // color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(blogPost.prcObjTest[index].tcolmName
                          // formData[index]?.filedName.toString(),
                          ),
                      // checkUserName[0].iSEnable == 0
                      //     ? Text('ki miya! kaj kore ni?')
                      //     : Container(
                      //         child: Text(formData[index].fuid),
                      //       ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
