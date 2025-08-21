import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/userModel.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Dio dio = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
  ));
  List<UserModel> list = [];

  void consultaUser() async {
    try {
      list.clear();
      final response = await dio.get('https://dummyjson.com/users');

      var data = response.data;

      if (response.statusCode == 200) {
        list =
            (data['users'] as List)
                .map((user) => UserModel.fromJson(user))
                .toList();
        setState(() {});
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User View', textAlign: TextAlign.center),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var cor = Colors.pink;
            var icon = Icons.female;
            if (list[index].sexo == 'male') {
              cor = Colors.blue;
              icon = Icons.male;
            } 
            return ListTile(
              title: Text(list[index].id.toString() + ' - ' + list[index].firstName, style: TextStyle(color: cor),
              ),
              subtitle: Text('Lastname: ' + ' ' + list[index].lastName),
              leading: CircleAvatar(
                child: Image(image: NetworkImage(list[index].image.toString())),
              ),
              trailing: Icon(icon, color: cor,),
              
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: consultaUser,
        child: const Text('Action Button'),
      ),
    );
  }
}
