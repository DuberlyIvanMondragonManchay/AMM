import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoTextField(
                placeholder: 'Username',
                padding: EdgeInsets.all(16),
                clearButtonMode: OverlayVisibilityMode.editing,
              ),
              SizedBox(height: 16),
              CupertinoTextField(
                placeholder: 'Password',
                padding: EdgeInsets.all(16),
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
              ),
              SizedBox(height: 32),
              CupertinoButton.filled(
                child: Text('Login'),
                onPressed: () {
                  // Lógica de inicio de sesión
                },
              ),
              SizedBox(height: 16),
              CupertinoButton(
                child: Text('Forgot password?'),
                onPressed: () {
                  // Lógica para recuperar contraseña
                },
              ),
              SizedBox(height: 16),
              CupertinoButton(
                child: Text('Sign up here'),
                onPressed: () {
                  // Lógica para registrarse
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
