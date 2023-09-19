// ignore_for_file: use_build_context_synchronously, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lesson_extra_fingerprint/src/routes/routes.dart';
import 'package:lesson_extra_fingerprint/src/services/auth_service.dart';

class LocalAuthScreen extends StatelessWidget {
  const LocalAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Auth'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.fingerprint,
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              bool isAuthenticated = await authService.authenticate();
              if(isAuthenticated) {
                Navigator.pushReplacementNamed(context, RoutePaths.homeScreen);
              } else {
                Container();
              }
            },
            child: const Text('Authenticación con huella'),
          ),
        ],
      )),
    );
  }
}
