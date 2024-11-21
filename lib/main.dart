import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  //GetData
  Future<void> getData() async {
    final res = await http.get(Uri.parse(
        "https://api.restful-api.dev/objects/ff80818192925da70192f236ea975118"));
    print(res.body.toString());
  }
//postdata

  Future<void> insertData() async {
    final res = await http.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": "Raja",
        "data": {
          "rollno": "12345",
          "class": "MSC",
          "Year": "3rd",
          "mark": "100",
        },
      }),
    );
    print(res.body.toString());
  }

  //update data
  Future<void> updateData() async {
    final res = await http.put(
      Uri.parse(
          "https://api.restful-api.dev/objects/ff80818192925da70192f24914a65134"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": "Raja.k",
        "data": {
          "rollno": "12345",
          "class": "MSC",
          "Year": "4th",
          "mark": "100",
        },
      }),
    );
    print(res.body.toString());
  }

  Future<void> deleteData() async {
    final res = await http.delete(
      Uri.parse(
          "https://api.restful-api.dev/objects/ff80818192925da70192f24914a65134"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(res.body.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    //insertData();
    //updateData();
    deleteData();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(),
      ),
    );
  }
}
