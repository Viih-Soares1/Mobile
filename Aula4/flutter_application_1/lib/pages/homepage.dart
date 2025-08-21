import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/postModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio dio = Dio();
  List<PostModel> postList = [];
  void consultaPost() async {
    try {
      postList.clear();
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );

      var data = response.data;

      if (response.statusCode == 200) {
        // map é um laço que percorre cada item da lista e converte para PostModel
        // response.data é uma lista de mapas, cada mapa representa um post
        postList =
            (data as List).map((post) => PostModel.fromJson(post)).toList();

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
        title: const Text('ListView API', textAlign: TextAlign.center),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) {
            var cor = Colors.red;
            if(postList[index].userId % 2 == 0) {
              cor = Colors.green;
            }
            return ListTile(
              title: Text(postList[index].title),
              subtitle: Text(postList[index].body),
              leading: CircleAvatar(
                child: Icon(Icons.person, color: cor,),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: consultaPost,  // chama a função consultaPost quando o botão é pressionado
        child: const Text('Consultar Posts'),
      ),
    );
  }
}
