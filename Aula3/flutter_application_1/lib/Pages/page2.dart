import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Page 2', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.check, color: Colors.green),
                ),
                title: const Text(
                  'Nome',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,                  
                  children: [Text('CPF'), Text('Email')]),
                trailing: const Icon(Icons.arrow_forward),
              ),
              Divider(color: Colors.greenAccent),
                ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.error, color: Colors.red),
                ),
                title: const Text(
                  'Nome',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('Razão Social'),
                trailing: const Icon(Icons.edit),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
