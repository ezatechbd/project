import 'dart:developer';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Details extends StatefulWidget {
  final String text;
  Details(this.text);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  String decoded;
  @override
  void initState() {
    var encoded = utf8.encode(widget.text);
    decoded = utf8.decode(encoded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              FlutterClipboard.copy(widget.text)
                  .then((value) => _key.currentState
                      // ignore: deprecated_member_use
                      .showSnackBar(new SnackBar(content: Text('Copied'))));
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('OCR Data from NID'),
              onPressed: () {
                // String start = "@Date of Birth";
                // String end = "@";

                String getText(String start, String end) {
                  String str = widget.text.toLowerCase();
                  final startIndex = str.indexOf(start);
                  final endIndex = str.indexOf(end, startIndex + start.length);
                  String textFromOcr =
                      str.substring(startIndex + start.length, endIndex);
                  // log('Scanned Text to Lowercase: $textFromOcr');
                  return textFromOcr;
                }

                log('Name: ${getText('name@', '@')}');
                log('NID No: ${getText('nid no@', '@')}');
                log('Date of Birth: ${getText('@date of birth', '@')}');
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          constraints: BoxConstraints(maxHeight: 200.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${getText('name@', '@')}'
                                  .toUpperCase()),
                              Text('NID No: ${getText('nid no@', '@')}'
                                  .toUpperCase()),
                              Text(
                                  'Date of Birth: ${getText('@date of birth', '@')}'
                                      .toUpperCase()),
                            ],
                          ),
                        ),
                      );
                    });
                // print(
                //     "${uploadModel.imageFile.lengthSync() / 1024} KB"); //print image size in kb
                // print(uploadModel
                //     .imageFile.path); //print image path
                // // log(PickImages.base64Image);
                // uploadImage(File(uploadModel.imageFile.path));
              },
            ),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              width: double.infinity,
              child: SelectableText(
                decoded.isEmpty ? 'No Text Available' : decoded,
                style: TextStyle(fontFamily: 'Kalpurush'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
