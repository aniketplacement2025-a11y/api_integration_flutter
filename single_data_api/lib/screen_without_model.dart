import 'package:api_integration_page/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {

  dynamic singlePost;
  bool isReady = false;

  _getSinglePostWithoutModel(){
    ApiServices().getSinglePostWithoutModel().then((value){
      isReady = true;
      setState(() {
        singlePost = value;
        isReady = false;
      });
    }).onError((error, stackTrace){
      print(error);
    });
  }

  @override
  void initState(){
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Without Model Single Data"),
        centerTitle: true,
      ),
      body: isReady == true?
          const Center(child: CircularProgressIndicator(),):

          Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                singlePost['userId'].toString(),
                    style:  TextStyle(
                  color: Colors.pink,
                      fontSize: 20,
                ),
              ),
              Text(
                  singlePost['title'].toString(),
                style:  TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              Text(
                singlePost['body'].toString(),
                style:  TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          )
    );
  }
}
