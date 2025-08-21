import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/loading.dart';
import 'package:flutter_application_1/shared/modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();

  void limparCampos() {
    _cepController.clear();
    _bairroController.clear();
    _ruaController.clear();
    _cidadeController.clear();
  }

  void consultaCep(String cep) async {
    limparCampos();

    try {
      Loading.show(context, mensagem: 'Carregando...');
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          sendTimeout: Duration(seconds: 5),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      final response = await dio.get('https://cep.awesomeapi.com.br/json/$cep');

      if (response.statusCode == 200) {
        _ruaController.text = response.data['address'] ?? '';
        _cidadeController.text = response.data['city'] ?? '';
        _bairroController.text = response.data['district'] ?? '';
        Loading.hide(context);
      } else {
        showModalErro(context, 'CEP não encontrado: ${response.statusCode}');
        limparCampos();
        Loading.hide(context);
        return;
      }
    } catch (e) {
      Loading.hide(context);

      if (e.toString().contains('Failed host lookup')) {
        showModalErro(context, 'Falha na conexão com a internet!');
      }else
      {
        showModalErro(context, 'Algum erro aconteceu!!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Exemplo de consumo de API com Dio'),
              TextField(
                maxLength: 8,
                controller: _cepController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Digite o CEP',
                  hintText: 'Ex: 18133080',
                ),
                onChanged: (value) {
                  int cep = int.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  consultaCep(_cepController.text);
                },
                child: const Text('Consultar CEP'),
              ),

              Form(
                child: Column(
                  spacing: 10,
                  children: [
                    TextFormField(
                      controller: _ruaController,
                      decoration: const InputDecoration(labelText: 'Rua: '),
                      readOnly: true,
                    ),
                    TextFormField(
                      controller: _bairroController,
                      decoration: const InputDecoration(labelText: 'Bairro:'),
                      readOnly: true,
                    ),
                    TextFormField(
                      controller: _cidadeController,
                      decoration: const InputDecoration(labelText: 'Cidade:'),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
