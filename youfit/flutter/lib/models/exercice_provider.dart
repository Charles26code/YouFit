import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:youfit/models/exercice_model.dart';

import 'dart:collection'; // nouveaux type de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la réponse http

// import 'exercices_model.dart';

// Commandes utiles :
// Lancer le serveur node (attendre le message "connexion ok !")
// backend> npm start

class ExercicesProvider with ChangeNotifier {
  final String host = 'http://localhost:3000';
  List<Exercice> _exercices = [];

  // Getter pour l'accès en lecture de l'ensemble des profiles
  // Pas de modificiation possible grâce au type UnmodifiableListView
  UnmodifiableListView<Exercice> get exercices =>
      UnmodifiableListView(_exercices);

  // Récupérer les données dans la base de données
  // void fetchData() async {
  //   try {
  //     http.Response response = await http.get(Uri.parse('$host/api/exerices'));
  //     if (response.statusCode == 200) {
  //       _users = (json.decode(response.body) as List)
  //           .map((userJson) => Exercice.fromJson(userJson))
  //           .toList();
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Ajouter un exercice dans la base de données
  // Future<void> addExercice(Exercice newExercice) async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('$host/api/uexerices'),
  //       body: json.encode(newUser.toJson()),
  //       headers: {'Content-type': 'application/json'},
  //     );
  //     if (response.statusCode == 200) {
  //       _users.add(
  //         Exercice.fromJson(
  //           json.decode(response.body),
  //         ),
  //       );
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<String> logExercice(Exercice exercice) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/exercice/login'),
        body: json.encode(exercice.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      Map<String, dynamic> temp = json.decode(response.body);

      if (response.statusCode == 200) {
        return ("200");
      } else {
        return (temp['error']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
