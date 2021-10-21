import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final CollectionReference users =
    FirebaseFirestore.instance.collection('usuarios');
final usrEmail = _auth.currentUser?.email;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            ElevatedButton(
                onPressed: () async => {
                      await _auth.signOut(),
                      Navigator.pop(context),
                    },
                child: Text('Sair')),
          ],
        ),
        body: FutureBuilder(
          future: users.where("email", isEqualTo: usrEmail).get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Algo deu errado.");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.docs.single;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Nome: ${data['nome']}",
                        style: TextStyle(fontSize: 20)),
                    Text("Endereco: ${data['endereco']}",
                        style: TextStyle(fontSize: 20)),
                    Text("${data['cidade']}, ${data['estado']}",
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              );
            }

            return Text("loading");
          },
        ));
  }
}
