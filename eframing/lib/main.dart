import 'package:flutter/material.dart';
import 'auth.dart';
import 'root_page.dart';

void main(){
    runApp(new MyApp());

}

class MyApp extends StatelessWidget{
     
       @override
  Widget build(BuildContext context) {
  
    return new MaterialApp(
        title: 'Login page ',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth())
    );
  }
}