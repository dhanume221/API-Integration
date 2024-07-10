import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class apihome extends StatefulWidget {
  const apihome({super.key});

  @override
  State<apihome> createState() => _apihomeState();
}

class _apihomeState extends State<apihome> {

bool isApiLoad = false;
String randumBucketlist = "Randum Bucketlist";

Future<void> fetchRandumData() async {

  setState(() {
    isApiLoad = true;
  });

  var apiUrl = Uri.parse("https://api.api-ninjas.com/v1/bucketlist");
  var header = {"X-Api-Key":"w9iQOVHooZ/JnPsyxrz79A==fLhGD1KOMd30ixUy"};

  final response = await http.get(apiUrl,headers: header);

  
  if(response.statusCode == 200) {

    print(response.body);

    setState(() {
      final json = jsonDecode(response.body);
      randumBucketlist = json["item"];
      isApiLoad = false;
    });
  }

  else {

    print("Something went wrong");
  }



}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      title: Text("Randum BucketList"),
    ),

    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(),
        isApiLoad == true ?
        CircularProgressIndicator()
        : Text(''' "$randumBucketlist" ''',
        style: TextStyle(
          fontSize : 30,
          fontWeight : FontWeight.bold,
          fontStyle: FontStyle.italic
        )
        ),
        SizedBox(
          height:30
        ),
        ElevatedButton(onPressed: (){
          fetchRandumData();
        }, child: 
        Text("OK")
        )
      ],
    ),


    );
  }
}

