class Student {
  String? name;
  int? age;
  String? email;
  String? phone;
  String? address;
  String? career;

  String toString() =>
      "El estudiante $name, de $age años, con correo $email, teléfono $phone, dirección $address y carrera $career";
}

class Teacher extends Student {}

main() {
  var t1 = new Teacher();
  t1.name = "Juan";
  t1.age = 30;
  t1.email = "juan@juan.com";
  t1.phone = "123456789";
  t1.address = "Calle 123";
  t1.career = "Ingeniería";

  print(t1);
}
