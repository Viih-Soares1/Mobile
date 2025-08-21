class PostModel {
  int userId = 0;
  int id = 0;
  String title = '';
  String body = '';
  String image = '';
  String sexo = '';

  PostModel();

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    
  }
}