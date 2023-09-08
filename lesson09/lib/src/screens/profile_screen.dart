import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  late AuthProvider provider;
  late User? user;

  @override
  Widget build(BuildContext context) {
    provider = AuthProvider();
    user = provider.getUsuario();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'BIENVENIDX:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text('Correo: ${user!.email}'),
          const SizedBox(height: 20),
          Text('UID: ${user!.uid}'),
        ],
      ),
    );
  }
}
