
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  
  final auth = FirebaseAuth.instance;

  Future<dynamic> registrar(correo, contrasenia) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
        email: correo, password: contrasenia);
      return newUser;
    } on FirebaseAuthException catch (err) {
      return err.message;
    }
  }

  Future<dynamic> iniciarSesion(correo, contrasenia) async {
    try {
      final loginUser = await auth.signInWithEmailAndPassword(
        email: correo, password: contrasenia);
      return loginUser;
    } on FirebaseAuthException catch (err) {
      return err.message;
    }
  }

  User? getUsuario() {
    return auth.currentUser;
  }

  Future<void> cerrarSesion() async {
    await auth.signOut();
  }

}