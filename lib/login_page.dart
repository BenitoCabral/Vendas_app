import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './usr_home_page.dart';
import './cadastro_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;

  @override
  void initState() {
    _auth.userChanges().listen(
          (event) => setState(() => user = event),
        );
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
          actions: [
            ElevatedButton(
                onPressed: () async => await _auth.signOut(),
                child: Text('Sair'))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo';
                      return null;
                    }),
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                  validator: (String? value) {
                    if (value!.isEmpty) return 'Preencha o campo';
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _entrarEmailSenha();
                      }
                    },
                    child: Text('Entrar')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cadastro())); // Navigator
                    },
                    child: Text('Cadastrar'))
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _entrarEmailSenha() async {
    try {
      UserCredential usuario = await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _senhaController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {}
  }
}
