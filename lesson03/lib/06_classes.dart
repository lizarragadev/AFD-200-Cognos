class Car {
  String? type;
  String? color;
  int? maxSpeed;
  int numOfSeats = 4;

  void aumentarVelocidad(int velocidad) {
    maxSpeed = maxSpeed! + velocidad;
  }

  String toString() =>
      "El carro es de tipo $type, de color $color, con velocidad máxima de $maxSpeed km/hr y con $numOfSeats asientos";
}

main() {
  var toyota = new Car();
  toyota.type = "Camioneta";
  toyota.color = "Rojo";
  toyota.maxSpeed = 200;

  print(toyota);

  toyota.aumentarVelocidad(150);

  print(toyota);
}
