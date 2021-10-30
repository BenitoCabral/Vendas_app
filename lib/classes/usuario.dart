import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Usuario {
  late String _nome;
  late String _email;
  late String _endereco;
  late String _cidade;
  late String _estado;

  Usuario() {}

  void setNome(nome) {
    this._nome = nome;
  }

  void setEmail(email) {
    this._email = email;
  }

  void setEndereco(endereco) {
    this._endereco = endereco;
  }

  void setCidade(cidade) {
    this._cidade = cidade;
  }

  void setEstado(estado) {
    this._estado = estado;
  }

  void cadastrarEmailSenha(String senha) async {
    try {
      var _cadastro = await _auth.createUserWithEmailAndPassword(
          email: this._email, password: senha);
      salvarDadosUsuario(_cadastro.user?.uid);
    } catch (e) {
      print(e);
    }
  }

  void salvarDadosUsuario(userID) {
    try {
      _firestore.collection('usuarios').doc(userID).set(usuarioToJson());
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> usuarioToJson() => {
        'nome': _nome,
        'email': _email,
        'endereco': _endereco,
        'cidade': _cidade,
        'estado': _estado,
      };
}
