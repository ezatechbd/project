import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';

class PdfReader extends StatefulWidget {
  final String pdflink;
  PdfReader({@required this.pdflink});

  @override
  _PdfReaderState createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Pdf view'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //color: Colors.green,
              child: Center(
                child: Container(
                  height: height,
                  width: width,
                  child: PdfPreview(
                    build: (format) => _generatePdfPreview(),
                    allowSharing: true,
                    allowPrinting: true,
                    useActions: true,
                    pdfFileName: 'Report',
                    canChangeOrientation: false,
                    canChangePageFormat: false,
                    // maxPageWidth: 400,
                    onError: (context) {
                      return Text('Sorry! can\'t be displayed');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdfPreview() async {
    final pdf = await NetworkAssetBundle(
      Uri.parse(widget.pdflink),
    ).load("");
    return pdf.buffer.asUint8List();
  }
  /*------------------Load pdf from assets----------------*/
  // Future<Uint8List> _generatePdfdoc() async {
  //   final pdf = await rootBundle.load('images/malaria.pdf');
  //   //await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());

  //   return pdf.buffer.asUint8List();
  // }
}
