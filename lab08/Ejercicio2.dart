import 'package:flutter/material.dart';

const String primeraPantallaRoute = '/';
const String segundaPantallaRoute = '/segunda';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        primeraPantallaRoute: (context) => PrimeraPantalla(),
        segundaPantallaRoute: (context) => SegundaPantalla()
      },
    );
  }
}

class PrimeraPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, segundaPantallaRoute);
          },
          child: Text('Navegar Segunda Pantalla'),
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, primeraPantallaRoute);
          },
          child: Text('Regresar'),
        ),
      ),
    );
  }
}
