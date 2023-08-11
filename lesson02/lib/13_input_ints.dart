import 'dart:io';

void main() {
  print("==========");
  print("Ingrese primer numero: ");
  int num1 = int.parse(stdin.readLineSync()!);
  print("Ingrese segundo numero: ");
  int num2 = int.parse(stdin.readLineSync()!);

  var sum = num1 + num2;

  print("El resultado es $sum");
  print("==========");

  // Comentarios
}
