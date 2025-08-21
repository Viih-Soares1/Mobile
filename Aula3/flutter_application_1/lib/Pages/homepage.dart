import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page2()),
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(Icons.home, color: Colors.white),
                ),
                title: const Text('Home'),
                subtitle: const Text('This is the home page'),
                trailing: const Icon(Icons.arrow_forward),
              ),
              Divider(color: Colors.greenAccent,),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(Icons.home, color: Colors.white),
                ),
                title: const Text('Home'),
                subtitle: const Text('This is the home page'),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
