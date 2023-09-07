import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'BIENVENIDX:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text('Correo: '),
          const SizedBox(height: 20),
          Text('UID: '),
        ],
      ),
    );
  }
}
