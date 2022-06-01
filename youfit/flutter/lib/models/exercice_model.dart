class Exercice {
  String? id;
  String name;
  String photo;
  String description;
  String difficulty;

  Exercice({
    this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.difficulty
  });

  Exercice.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        description = json['description'],
        photo = json['photo'],
        difficulty = json['difficulty'];

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

  difficultyToString(){
    Map result ={
      "1" : "DEBUTANT",
      "2" : "INTERMEDIAIRE",
      "3" : "AVANCE",
    };

    return result[difficulty];
  }
  
}
