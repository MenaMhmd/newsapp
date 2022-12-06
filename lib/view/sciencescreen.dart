import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:newapp/model/newsmodel.dart';
import '../controller/newscontroller.dart';


class Sciencescreen extends GetWidget {
  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder(
        future: newscontroller.getData("science"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          Newsmodel dataa = snapshot.data;
          return ListView.separated(
            itemCount: dataa.articles?.length ?? 0,
            itemBuilder: (context, index) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.grey[600],),

                );
              }
              //  List list=snapshot.data[index]["articles"];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.network(
                            dataa.articles![index].urlToImage.toString(),
                            fit: BoxFit.cover,
                          )),
                      Text(
                        textAlign: TextAlign.right,
                        dataa.articles![index].title ?? " ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        textAlign: TextAlign.right,
                        dataa.articles![index].description ?? " ",
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 7,
                width: double.infinity,
                color: Colors.white,
              );
            },
          );
        },
      ),
    );
  }
}