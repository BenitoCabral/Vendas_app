import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              autofocus: true,
              keyboardType: TextInputType.text,
              style: new TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                  labelText: "LOGIN",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            Divider(),
            Divider(),
            TextField(
              autofocus: true,
              obscureText: true,
              keyboardType: TextInputType.number,
              style: new TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            Divider(),
            ButtonTheme(
              height: 60.0,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
            Divider(),
            ButtonTheme(
              height: 60.0,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
