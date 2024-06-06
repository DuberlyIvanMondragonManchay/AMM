import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino and Material Alerts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Show Material Alert'),
              onPressed: () {
                _showMaterialAlert(context);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Show Material Alert with Options'),
              onPressed: () {
                _showMaterialAlertWithOptions(context);
              },
            ),
            SizedBox(height: 20),
            CupertinoButton(
              child: Text('Show Cupertino Alert'),
              onPressed: () {
                _showCupertinoAlert(context);
              },
            ),
            SizedBox(height: 20),
            CupertinoButton(
              child: Text('Show Cupertino Alert with Options'),
              onPressed: () {
                _showCupertinoAlertWithOptions(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMaterialAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Material Alert'),
          content: Text('This is a simple Material alert.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMaterialAlertWithOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Material Alert with Options'),
          content: Text('This is a Material alert with options.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Alert'),
          content: Text('This is a simple Cupertino alert.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlertWithOptions(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Alert with Options'),
          content: Text('This is a Cupertino alert with options.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
