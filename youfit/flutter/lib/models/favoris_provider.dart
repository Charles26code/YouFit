import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert'; // pour decoder la réponse http
import 'package:youfit/models/exercice_provider.dart';

// Commandes utiles :
// Lancer le serveur node (attendre le message "connexion ok !")
// backend> npm start

class FavorisProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  getExercicesFavorisForOneUser(String userId) async{
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/favoris/getFavorisForOneUser'),
        body: json.encode({
          "userId": userId
        }),
        headers: {'Content-type': 'application/json'}
      );
      if (response.statusCode == 200) {
        List ids = [];
        json.decode(response.body).forEach((element) => ids.add(element['exerciceId']));
        List exercices = await ExerciceProvider.getExercices(ids, host) as List;
        return exercices;
      }
    } catch (e) {
      rethrow;
    }
  }

  addToFavoris(String userId, String exerciceId) async{
    try{
      http.Response response = await http.post(
        Uri.parse('$host/api/favoris/add'),
        body: json.encode({
          "userId": userId,
          "exerciceId": exerciceId
        }),
        headers: {'Content-type': 'application/json'}
      );
      String message = response.statusCode == 200 ? json.decode(response.body)['message'] : "Erreur Serveur";
      return message;
    }catch(e){
      rethrow;
    }
  }

  removeFromFavoris(String userId, String exerciceId) async{
    try{
      http.Response response = await http.post(
        Uri.parse('$host/api/favoris/remove'),
        body: json.encode({
          "userId": userId,
          "exerciceId": exerciceId
        }),
        headers: {'Content-type': 'application/json'}
      );
      String message = response.statusCode == 200 ? json.decode(response.body)['message'] : "Erreur Serveur";
      return message;
    }catch(e){
      rethrow;
    }
  }
}
