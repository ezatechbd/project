import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_img/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<PostModel>> getSinglePostData(context) async {
  List<PostModel> result = [];
  try {
    final response = await http.get(
      Uri.parse("https://picsum.photos/v2/list"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      result = postModelFromJson(response.body);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Data not found!"),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
      ),
    );
    log(e.toString());
  }
  return result;
}
