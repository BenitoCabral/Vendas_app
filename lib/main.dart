import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vendas_app/pages/authentication.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vendas App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Authentication(),
    );
  }
}
