import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
import 'user_model.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://localhost:80';
  List<User> _users = [];
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);
  // R ́ecup ́erer les donn ́ees dans la base de donn ́ees
   fetchData() async {
    try {
    http.Response response = await http.get(Uri.parse('$host/api/users'));
    if (response.statusCode == 200) {
      _users = (json.decode(response.body) as List)
      .map((userJson) => User.fromJson(userJson))
      .toList();
      notifyListeners();
      return _users;
    }
    } catch (e) {
      rethrow;
    }
  }

  // Ajouter un user dans la base de donn ́ees
  Future<void> addUser(User newUser) async {
    try {
      http.Response response = await http.post(
      Uri.parse('$host/api/user'),
      body: json.encode(newUser.toJson()),
      headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> login(String? mailusername, String? mdp) async {
    try {
      Map retour = {};
      http.Response response = await http.post(
        Uri.parse('$host/api/users/login'),
        body: json.encode({
          'email': mailusername,
          'password': mdp
        }),
        headers: {'Content-type': 'application/json'},
      );
      retour.addAll({"statusCode": response.statusCode});
      if (response.statusCode == 200) {
        User monUser = User.fromJson(json.decode(response.body));
        retour.addAll({"message": monUser.showUser()});
      }
      if (response.statusCode == 401) {
        Map<String, dynamic> json = jsonDecode(response.body);
        retour.addAll({"message": json['error']});
      }
      return retour;
    } catch (e) {
      rethrow;
    }
  }
}