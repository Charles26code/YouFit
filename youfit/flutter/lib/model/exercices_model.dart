class Exercices {
  String? id;
  String email;
  String password;

  Exercices({
    this.id,
    required this.email,
    required this.password,
  });

  Exercices.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'email': email,
        'password': password,
      };
    } else {
      return {
        'email': email,
        'password': password,
      };
    }
  }

  String showUser() {
    return "$email\n$password\n\n";
  }
}
