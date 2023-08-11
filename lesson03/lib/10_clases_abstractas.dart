abstract class Student {
  contactInfo();
}

class ITStudent extends Student {
  @override
  contactInfo() {
    print("Contacto de estudiante de IT");
  }
}

main() {
  final itStudent = new ITStudent();
  itStudent.contactInfo();
}
