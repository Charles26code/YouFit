import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:youfit/models/user_provider.dart';
import 'package:youfit/screen/AddExercice.dart';
import 'package:youfit/screen/LoginScreen.dart';
import 'package:youfit/screen/Login.dart';
import 'package:youfit/screen/SignUpScreen.dart';
import 'package:youfit/screen/ForgetPassword.dart';
import 'package:provider/provider.dart';
import 'package:youfit/screen/all_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(
        title: 'YouFit',
        //theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        //home: View_1(), // premiere vue
        // home: View_2(), // premiere vue
        //home: LoginScreen(), // premiere vue
        //home: AddExercice() // premiere vue
        //home: ListExercice() // premiere vue
        //home: Login(),
        //home: SignUpScreen(),
        //home: ForgetPassword(),
        home: LoginScreen(),
        ),
    );
  }
}
