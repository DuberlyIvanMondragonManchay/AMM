import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const String primeraPantallaRoute = '/';
const String segundaPantallaRoute = '/segunda';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: primeraPantallaRoute,
      routes: {
        primeraPantallaRoute: (context) => PrimeraPantalla(),
        segundaPantallaRoute: (context) => SegundaPantalla(),
      },
    );
  }
}

class PrimeraPantalla extends StatefulWidget {
  @override
  _PrimeraPantallaState createState() => _PrimeraPantallaState();
}

class _PrimeraPantallaState extends State<PrimeraPantalla> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Ingrese un texto',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            segundaPantallaRoute,
            arguments: _textController.text,
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
class SegundaPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? texto = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Texto ingresado:',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              texto ?? 'No se ingresó ningún texto',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
