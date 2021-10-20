import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendas_app/pages/login.page.dart';
import 'package:vendas_app/provider/users.dart';
import 'package:vendas_app/routes/app_routes.dart';
import 'package:vendas_app/views/user_form.dart';
import 'package:vendas_app/views/user_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'MyApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          AppRoutes.HOME: (_) => LoginPage(),
          //AppRoutes.LOGIN_PAGE: (ctx) => LoginPage(),
          AppRoutes.USER_LIST: (ctx) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm()
        },
        //home: MyHomePage(title: 'Flutter Demo Teste Daniel'),
      ),
    );
  }
}
