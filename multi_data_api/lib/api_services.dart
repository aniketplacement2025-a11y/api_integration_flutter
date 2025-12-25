import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'multi_data_model.dart';


class ApiServices {
  Future<MultiData?> getMultiDataWithModel() async{
    try {
     var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
     if(response.statusCode == 200 || response.statusCode == 201){
       MultiData model = MultiData.fromJson(json.decode(response.body));
       return model;
     }
    }catch(e){
      print(e);
    }
    return null;
  }
}