import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:collection'; // nouveaux type de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la réponse http

import 'package:youfit/models/exercice_model.dart';

// Commandes utiles :
// Lancer le serveur node (attendre le message "connexion ok !")
// backend> npm start

class ExerciceProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  // Récupérer les données dans la base de données
  getAllExercices() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/exercices'));
      if (response.statusCode == 200) {
        List result = [];
        json.decode(response.body).forEach((element) => result.addAll([Exercice.fromJson(element)]));
        return result;
      }
    } catch (e) {
      rethrow;
    }
  }

  static getExercices(List ids, String host) async{
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/exercices/getExercices'),
        body: json.encode({
          "ids": ids
        }),
        headers: {'Content-type': 'application/json'}
      );
      if (response.statusCode == 200) {
        List exercices = [];
        json.decode(response.body).forEach((element) => exercices.addAll([Exercice.fromJson(element)]));
        return exercices;
      }
    } catch (e) {
      rethrow;
    }
  }

  createExercice(String? name, String? description, String? difficulty, String? photo) async{
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/exercices/add'),
        body: json.encode({
          "name": name,
          "description": description,
          "difficulty": difficulty,
          "photo": photo,
        }),
        headers: {'Content-type': 'application/json'}
      );
      String message = json.decode(response.body)['message'];
      return message;
    } catch (e) {
      rethrow;
    }
  }
}
