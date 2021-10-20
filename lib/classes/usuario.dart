import './endereco.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Usuario {
  String _nome;
  String _email;
  Endereco _endereco;

  Usuario(String nome, String email, String rua, String bairro, String cidade,
      String estado) {
    this._nome = nome;
    this._email = email;
    this._endereco = Endereco(rua, bairro, cidade, estado);
  }

  void cadastrarEmailSenha(String senha) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: this._email, password: senha);
    } catch (e) {
      print(e);
    }
  }
}
