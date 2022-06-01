class Exercice {
  String? id;
  String name;
  String photo;
  String description;
  int difficulty;

  Exercice(
      {this.id,
      required this.name,
      required this.photo,
      required this.description,
      required this.difficulty});

  set password(String password) {}

  set email(String email) {}

  fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'name': name,
        'photo': photo,
        'description': description,
        'difficulty': difficulty
      };
    } else {
      return {
        'name': name,
        'photo': photo,
        'description': description,
        'difficulty': difficulty
      };
    }
  }
}
