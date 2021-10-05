import 'package:flutter/material.dart';
import 'package:vendas_app/pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginPage(),
      //home: MyHomePage(title: 'Flutter Demo Teste Daniel'),
    );
  }
}
