import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vendas_app/classes/usuario.dart';

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
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _enderecoController,
                    decoration: InputDecoration(labelText: 'Endereço'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _cidadeController,
                    decoration: InputDecoration(labelText: 'Cidade'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _estadoController,
                    decoration: InputDecoration(labelText: 'Estado'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
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
                          _auth.signOut();
                          Usuario usuario = Usuario(
                              _nomeController.text,
                              _emailCotroller.text,
                              _enderecoController.text,
                              _cidadeController.text,
                              _estadoController.text);
                          usuario.cadastrarEmailSenha(_senhaCotroller.text);
                          usuario.cadastrarUsuario();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Cadastrar'))
                ],
              ),
            )));
  }

// Limpa os valores salvos do formulário
  @override
  void dispose() {
    _emailCotroller.dispose();
    _senhaCotroller.dispose();
    _nomeController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _enderecoController.dispose();
    super.dispose();
  }

  /*Future<void> _cadastrarEmailSenha() async {
    await _auth.createUserWithEmailAndPassword(
        email: _emailCotroller.text, password: _senhaCotroller.text);
    Navigator.pop(context);
  }*/
}
