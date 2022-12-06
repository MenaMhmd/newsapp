import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:newapp/model/newsmodel.dart';
import 'package:newapp/view/sciencescreen.dart';
import 'package:newapp/view/sportsscreen.dart';

import '../controller/newscontroller.dart';
import 'newsscreen.dart';

class Homescreen extends GetWidget {
  //key=fa80f33e4758484bb630f10be1dfc9d0
  //baseurl=https://newsapi.org
  //methods=/v2/top-headlines
  //query=country=us&
  //Get
  // url=https://newsapi.org/v2/top-headlines?country=us&apiKey=fa80f33e4758484bb630f10be1dfc9d0
final tabs=[
  Newsscreen(),
  Sportsscreen(),
  Sciencescreen(),


];
  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],

        title: Text(
          "News App",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: GetX<Newscontroller>(builder: (controller)=>tabs[controller.indexitem.value]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:newscontroller.indexitem.value ,
          selectedItemColor: Colors.grey[300],
          backgroundColor:Colors.deepPurple[900] ,
        onTap: (val)
        {
          newscontroller.indexitem.value=val;
        },
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home),backgroundColor:Colors.white,label: "News" ,),
            BottomNavigationBarItem(icon:Icon(Icons.sports),backgroundColor:Colors.white,label: "Sports" ),
            BottomNavigationBarItem(icon:Icon(Icons.science),backgroundColor:Colors.white,label: "Science" ),
        ],),

    );
  }
}
