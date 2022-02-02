import 'package:flutter/material.dart';
import 'package:flutter_img/model/model.dart';
import 'package:flutter_img/service/service.dart';

class PostDataProvider with ChangeNotifier {
  List<PostModel> post = [];
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;
    notifyListeners();
  }
}
