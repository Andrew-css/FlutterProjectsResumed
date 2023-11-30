import 'package:flutter/material.dart';
import 'package:flutter_application_1/globales.dart';
import 'main.dart';

void main() {
  runApp(const MyExampleCard());
}

class MyExampleCard extends StatelessWidget {
  const MyExampleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cards app'),
        ),
        body: Center(
          child: Container(
            color: const Color.fromARGB(255, 221, 237, 200),
            padding: const EdgeInsets.all(16.0),
            child: const Align(
              alignment: Alignment.topCenter,
              child: MyCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        shadowColor: Colors.black.withOpacity(0.5),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.person, size: 70.0),
                title: Container(
                  width: double.infinity,
                  child: Text(
                    'Datos Vendedor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Column(
                  children: [
                    Text('Nombre: ${mivendedor?.vendedor?.nombre}'),
                    Text('Apellido: ${mivendedor?.vendedor?.apellido}'),
                    Text('Cedula: ${mivendedor?.vendedor?.cedula}'),
                    Text('Teléfono: ${mivendedor?.vendedor?.telefono}'),
                    Text('Usuario: ${mivendedor?.vendedor?.usuario}'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print(mivendedor?.vendedor);
                      Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MyApp(),
                            ),
                          );
                    },
                    child: const Text('Cerrar sesión'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
