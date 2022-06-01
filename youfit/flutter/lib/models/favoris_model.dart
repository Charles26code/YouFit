class Favoris {
  String? id;
  String userId;
  String exerciceId;

  Favoris({
    this.id,
    required this.userId,
    required this.exerciceId
  });

  Favoris.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        userId = json['userId'],
        exerciceId = json['exerciceId'];

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'userId': userId,
        'exerciceId': exerciceId,
      };
    } else {
      return {
        'userId': userId,
        'exerciceId': exerciceId,
      };
    }
  }
  
}
