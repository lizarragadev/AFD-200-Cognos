// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class AuthService {
  late LocalAuthentication auth;

  AuthService() {
    auth = LocalAuthentication();
  }

  Future<bool> checkBiometrics() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = await auth.isDeviceSupported();
    if(canAuthenticateWithBiometrics || canAuthenticate) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch(e) {
      return false;
    }
    if(availableBiometrics.isNotEmpty) {
      if(availableBiometrics.contains(BiometricType.strong) || availableBiometrics.contains(BiometricType.face)) {
        return true;
      }
    }
    return false;
  }

  Future<bool> authenticate() async {
    final bool isBiometricAvailable = await checkBiometrics();
    if(isBiometricAvailable) {
      final bool isAvailableBiometric = await getAvailableBiometrics();
      if(isAvailableBiometric) {
        try {
          return await auth.authenticate(
            localizedReason: "Coloque su huella el en lector para ingresar",
            authMessages: const [
              AndroidAuthMessages(
                signInTitle: "Se requiere autenticación biométrica",
                biometricHint: "Verifica tu identidad"
              ),
              IOSAuthMessages(
                cancelButton: "No gracias",
                goToSettingsButton: "Configuraciones",
                goToSettingsDescription: "Por favor, configure Touch ID"
              )
            ],
            options: AuthenticationOptions(
              useErrorDialogs: true, biometricOnly: true, stickyAuth: true
            )
          );
        } on PlatformException catch(e) {
          print(e.message);
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
