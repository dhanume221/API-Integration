
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 Future<void> fetchData() async{
    var baseurl = Uri.parse("https://www.dummy.restapiexample.com/api/v1/employees");
    final response = await http.get(baseurl);
    if(response.statusCode == 200){
      print(response.body.toString());
    }
    else{
      print("Something went wrong");

    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(onPressed: (){
           fetchData();
        }, 
        
        child:Text("OK") )
        


      ),
    );
  }
}