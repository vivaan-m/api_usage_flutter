import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Colors.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var apiData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:apiData==null?Container(
        child: Center(
          child: RawMaterialButton(
            child: Text("Hit Api",style: TextStyle(color: white()),),
            onPressed: () {
              hitApi();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 20,
            fillColor: black(),
          ),
        ),
      ):Container(child: ListView.builder(itemBuilder:(context,index){
        return Card(
          color: blue(),
          child: ListTile(
            dense: true,
            title: Text("${apiData[index]["title"]}",style: TextStyle(color: white()),),
            subtitle:  Text("${apiData[index]["body"]}",style: TextStyle(color: white().withOpacity(0.5)),),
          ),
        );
      })),
    );
  }




  hitApi(){
    Future<http.Response> data(){
      return http.get("https://jsonplaceholder.typicode.com/posts");
    }

    data().then((response){
      print(response.body);
      setState(() {
        apiData = json.decode(response.body);

      });
    });



  }







}
