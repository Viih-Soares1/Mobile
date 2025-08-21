class UserModel {
  int id = 0;
  String firstName = '';
  String lastName = '';
  String maidenName ='';
  int age = 18;
  String gender = '';
  String email = '';
  String phone = '';
  String image = '';
  String sexo = '';

  UserModel();
  
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    sexo = json['gender'];
  }
}