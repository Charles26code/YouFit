import 'package:flutter/material.dart';
import 'package:youfit/models/user_provider.dart';
import 'package:youfit/screen/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:youfit/models/exercice_provider.dart';
import 'package:youfit/models/favoris_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (contexte) => UserProvider()
        ),
        ChangeNotifierProvider<ExerciceProvider>(
          create: (contexte) => ExerciceProvider()
        ),
        ChangeNotifierProvider<FavorisProvider>(
          create: (contexte) => FavorisProvider()
        )
      ],
        child: const MaterialApp(
          title: 'YouFit',
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
    );
  }
}
