import 'dart:io';

void main() {
  print("==========");
  print("Ingrese su nombre: ");
  String name = stdin.readLineSync()!;
  print("Hola $name");
  print("==========");
}
