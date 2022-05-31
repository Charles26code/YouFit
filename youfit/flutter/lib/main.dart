import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:youfit/screen/AddExercice.dart';
import 'package:youfit/screen/LoginScreen.dart';
import 'package:youfit/screen/Login.dart';
import 'package:youfit/screen/ListExercice.dart';
import 'package:youfit/screen/SignUpScreen.dart';
import 'package:youfit/screen/ForgetPassword.dart';
import 'package:youfit/model/exercices_provider.dart';
import 'package:provider/provider.dart';
//import 'form_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Utilisation d'un provider avec un ChangeNotifierProvider
// pour notifier les widgets utilisant le provider
// qu'ils doivent se rebuild s'il est modifi ́e (via la
// m ́ethode notifyListeners())
    return ChangeNotifierProvider<ExercicesProvider>(
        create: (contexte) => ExercicesProvider(),
        child: const MaterialApp(
          title: 'YouFit',
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ));
  }
}
