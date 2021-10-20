import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCotroller = TextEditingController();
  final TextEditingController _senhaCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailCotroller,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (String? value) {
                  if (value!.isEmpty) return 'Preencha o campo.';
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: _senhaCotroller,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (String? value) {
                  if (value!.isEmpty) return 'Preencha o campo.';
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _cadastrarEmailSenha();
                    }
                  },
                  child: Text('Cadastrar'))
            ],
          ),
        ));
  }

// Limpa os valores salvos do formulário
  @override
  void dispose() {
    _emailCotroller.dispose();
    _senhaCotroller.dispose();
    super.dispose();
  }

  Future<void> _cadastrarEmailSenha() async {
    await _auth.createUserWithEmailAndPassword(
        email: _emailCotroller.text, password: _senhaCotroller.text);
    Navigator.pop(context);
  }
}
