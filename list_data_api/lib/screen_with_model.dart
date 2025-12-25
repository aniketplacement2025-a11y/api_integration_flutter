import 'package:flutter/material.dart';
import 'package:list_data_api/api_services.dart';
import 'package:list_data_api/post_modal.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  bool isReady = false;
  List<PostModel> postModal = [];

  _getPost(){
    isReady = true;
    ApiServices().getPostWithModel().then((value){
      setState(() {
       postModal = value!;
       isReady = false;
      });
    }).onError((error, stackTrace)
     => null);
  }

  @override
  void initState(){
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Posts With Model"),
      ),

      body: isReady == true?
      Center(child: CircularProgressIndicator(),):
          ListView.builder(
            itemCount: postModal.length,
              itemBuilder: (context, index){
               return Card(
                 margin: EdgeInsets.all(8),
                 child: ListTile(
                   leading: Text(postModal[index].userId.toString()),
                   title: Text(postModal[index].title.toString()),
                   subtitle: Text(postModal[index].body.toString()),
                 ),
               );
              })
    );
  }
}
