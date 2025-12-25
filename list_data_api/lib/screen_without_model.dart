import 'package:flutter/material.dart';
import 'package:list_data_api/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {

  bool isReady = false;

  dynamic postlist = [];

  _getPost(){
    isReady = true;
    ApiServices().getPostWithOutModel().then((value){
      setState(() {
       postlist = value;
       isReady = false;
      });
    }).onError((error, stackTrace){
      print(error);
    });
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
        title: Text("Posts Without Model"),
      ),
      // DONE ALL THE THINGS WITH THE HELP OF LIST BUILDER
      // body: isReady == true?
      //  const Center(child: CircularProgressIndicator(),):
      //     ListView.builder(
      //       itemCount: postlist.length,
      //         itemBuilder: (context, index){
      //          return Card(
      //            child: ListTile(
      //              leading: Text(
      //                postlist[index]['id'].toString()
      //              ),
      //              title: Text(
      //                postlist[index]['title'].toString()
      //              ),
      //              subtitle: Text(
      //                postlist[index]['body'].toString()
      //              ),
      //            ),
      //          );
      //         },
      //     ),

        // DOING ALL THE THINGS WITH THE HELP OF FUTUTRE BUILDER
        body: FutureBuilder(
            future: ApiServices().getPostWithOutModel(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (context , index){
                      return Card(
                        margin: EdgeInsets.all(20),
                       child: ListTile(
                         title: Text(
                             snapshot.data[index]['title'].toString(),
                             style: TextStyle(
                               color: Colors.red,
                             ),
                         ),
                         subtitle: Text(
                           snapshot.data[index]['body'].toString(),
                           style: TextStyle(
                             color: Colors.greenAccent
                           ),
                         ),
                       ),
                      );
                    });
              }else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
    );
  }
}
