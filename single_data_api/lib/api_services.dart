import 'dart:convert';

import 'package:api_integration_page/single_post_with_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // With Model
  Future<SinglePostWithModel?> getSinglePostWithModel() async{
     try {
       var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
       var response = await http.get(url);

       if(response.statusCode == 200 || response.statusCode == 201){
         SinglePostWithModel model = SinglePostWithModel.fromJson(json.decode(response.body));
         return model;
       }
     } catch (e){
       print(e.toString());
     }
 }

 // Without Model
 Future<dynamic> getSinglePostWithoutModel() async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if(response.statusCode == 200){
        final body = response.body;
        final data = jsonDecode(body);
        return data;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
 }
}