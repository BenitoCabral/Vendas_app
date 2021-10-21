import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
late UserCredential _usuario;

class Usuario {
  late String _nome;
  late String _email;
  late String _endereco;
  late String _cidade;
  late String _estado;

  Usuario(this._nome, this._email, this._endereco, this._cidade, this._estado);

  Future<void> cadastrarEmailSenha(String senha) async {
    try {
      _usuario = await _auth.createUserWithEmailAndPassword(
          email: this._email, password: senha);
    } catch (e) {
      print(e);
    }
  }

  Future<void> cadastrarUsuario() async {
    try {
      await _firestore.collection('usuarios').add(usuarioToJson());
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
