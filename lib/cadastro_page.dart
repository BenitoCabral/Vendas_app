import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vendas_app/classes/usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _senhaCotroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Usuario usuario = new Usuario();

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
                    onChanged: (nome) => usuario.setNome(nome),
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (endereco) => usuario.setEndereco(endereco),
                    decoration: InputDecoration(labelText: 'Endereço'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (cidade) => usuario.setCidade(cidade),
                    decoration: InputDecoration(labelText: 'Cidade'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (estado) => usuario.setEstado(estado),
                    decoration: InputDecoration(labelText: 'Estado'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Preencha o campo.';
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (email) => usuario.setEmail(email),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Cadastrando...")));
                          usuario.cadastrarEmailSenha(_senhaCotroller.text);
                          _auth.signOut();
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
    _senhaCotroller.dispose();
    super.dispose();
  }
}
