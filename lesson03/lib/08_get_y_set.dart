class Car {
  String? type;
  String? color;
  int? maxSpeed;
  int? numOfSeats;

  set setType(String valor) => this.type = valor;

  String? get getType => this.type!;

  String toString() =>
      "El carro es de tipo $type, de color $color, con velocidad máxima de $maxSpeed km/hr y con $numOfSeats asientos";
}

main() {
  final toyota = new Car();
  toyota.setType = "Minibus";
  print(toyota.getType);
}
