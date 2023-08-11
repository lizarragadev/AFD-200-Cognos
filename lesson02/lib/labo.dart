import 'dart:io';

void main() {
  print("================================");
  print("********* PEDIDOS DE PIZZA *********");
  print("Precios:");
  print("Pequeña (p): Bs. 40 | Mediana (m): Bs. 60 | Grande (g): Bs. 80");
  print("Ingrese el tamaño de la pizza que desea pedir:");
  String size = stdin.readLineSync()!;
  print("Ingrese la cantidad de pizzas que desea pedir:");
  int quantity = int.parse(stdin.readLineSync()!);

  var price = 0;
  var total = 0;

  switch (size) {
    case "p":
      price = 40;
      break;
    case "m":
      price = 60;
      break;
    case "g":
      price = 80;
      break;
    default:
      print("Tamaño de pizza no válido");
      break;
  }

  total = price * quantity;
  if (total != 0) {
    print("El total a pagar es: Bs. $total");
  }

  print("================================");
}
