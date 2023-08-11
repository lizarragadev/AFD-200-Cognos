class Car {
  String? type;
  String? color;
  int? maxSpeed;
  int? numOfSeats;

  /*Car(String type, String color, int maxSpeed) {
    this.type = type;
    this.color = color;
    this.maxSpeed = maxSpeed;
  }*/

  Car({this.type, this.color, this.maxSpeed, this.numOfSeats});

  Car.uno() {
    type = "Peta";
    color = "Azul";
    maxSpeed = 150;
    numOfSeats = 4;
  }

  Car.dosArgs(t, c, m, n) {
    type = t;
    color = c;
    maxSpeed = m;
    numOfSeats = n;
  }

  void aumentarVelocidad(int velocidad) {
    maxSpeed = maxSpeed! + velocidad;
  }

  String toString() =>
      "El carro es de tipo $type, de color $color, con velocidad máxima de $maxSpeed km/hr y con $numOfSeats asientos";
}

main() {
  var toyota =
      new Car(color: "Rojo", maxSpeed: 200, type: "Vagoneta", numOfSeats: 4);

  print(toyota);

  final peta = new Car.uno();

  print(peta);

  final auto = new Car.dosArgs("Taxi", "Blanco", 200, 6);

  print(auto);
}
