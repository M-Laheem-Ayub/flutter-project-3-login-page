import 'package:flutter/material.dart';
import 'package:flutter_application_3/HomePage.dart';

//user input
//TextFormFeild
//TextEditingController
//obsecureText
//Form
//final _formKey = GlobalKey<FormState>();
//validator
//controller

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
