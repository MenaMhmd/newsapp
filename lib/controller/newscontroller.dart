import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:newapp/model/newsmodel.dart';

class Newscontroller extends GetxController{

 RxInt indexitem=0.obs;
  getData(String cat)async{
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=2a774b30f4754f2ebaf04223f71a9a5b");
    http.Response response = await http.get(url);

    if(response.statusCode==200)
    {
      try{
        return Newsmodel.fromJson(jsonDecode(response.body));
      }catch(e)
      {
        Get.snackbar("error", e.toString());
      }
    }
  }


}