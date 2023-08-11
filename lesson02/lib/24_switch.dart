void main() {
  int day = 1;
  String today = "";
  switch (day) {
    case 1:
      today = "Lunes";
      break;
    case 2:
      today = "Martes";
      break;
    case 3:
      today = "Miercoles";
      break;
    case 4:
      today = "Jueves";
      break;
    case 5:
      today = "Viernes";
      break;
    case 6:
      today = "Sabado";
      break;
    case 7:
      today = "Domingo";
      break;
    default:
      today = "Dia no válido";
  }
  print(today);
}
