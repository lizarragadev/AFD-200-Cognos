import 'package:lesson03/lab_objeto.dart';

main() {
  final empleado = new Employee("Developer", "Guatemala", 1000.0);

  print("Datos iniciales $empleado");

  if (empleado.getSalary >= 2000)
    empleado.setSalary = 400;
  else
    empleado.setSalary = 600;

  print("Datos finales $empleado");
}
