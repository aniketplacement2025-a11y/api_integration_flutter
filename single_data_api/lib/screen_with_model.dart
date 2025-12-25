import 'package:api_integration_page/api_services.dart';
import 'package:api_integration_page/single_post_with_model.dart';
import 'package:flutter/material.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  bool isReady = false;

  SinglePostWithModel singlePostWithModel = SinglePostWithModel();

  _getSinglePost(){
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value){
         setState(() {
           singlePostWithModel = value!;
           isReady = false;
         });
      }).onError((error, stackTrace){
        print(error);
        setState(() {
          isReady = false;
        });
    });
  }

  @override
  void initState(){
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post With Modal Single Data"),
      ),
      body: isReady == true?
       Center(child: CircularProgressIndicator(),)
       : Column(
        mainAxisAlignment: .center,
        children: [
          Text(
              singlePostWithModel.userId.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: .bold,
              color: Colors.blue,
            ),
          ),

          SizedBox(height: 10),

          Text(
            singlePostWithModel.title.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: .bold,
              color: Colors.green,
            ),
          ),

          SizedBox(height: 10),

          Text(
            singlePostWithModel.body.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: .bold,
              color: Colors.red,
            ),
          ),
      ],),
    );
  }
}
