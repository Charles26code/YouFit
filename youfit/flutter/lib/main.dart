import 'package:flutter/material.dart';
import 'package:youfit/screen/AddExercice.dart';
import 'package:youfit/screen/LoginScreen.dart';
import 'package:youfit/screen/Login.dart';
import 'package:youfit/screen/ListExercice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'YouFit',
        //theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        //home: View_1(), // premiere vue
        // home: View_2(), // premiere vue
        //home: LoginScreen(), // premiere vue
        //home: AddExercice() // premiere vue
        home: ListExercice() // premiere vue
        //home: Login(),
        );
  }
}
