import 'package:flutter/material.dart';
import 'package:flutter_img/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProviderDemoScreen extends StatefulWidget {
  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<PostDataProvider>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<PostDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Provider Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: postMdl.loading
            ? Container(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: postMdl.post.length,
                    padding: EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      String imageUrl =
                          postMdl.post[index].downloadUrl.toString();
                      var newImgUrl =
                          imageUrl.substring(0, imageUrl.length - 10);
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              // color: Colors.red,
                              // child: Image.network(
                              //   '$newImgUrl/300/300',
                              //   fit: BoxFit.cover,
                              //   filterQuality: FilterQuality.low,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: "$newImgUrl/200/200",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
      ),
    );
  }
}
