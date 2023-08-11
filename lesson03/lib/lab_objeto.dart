class Employee {
  String jobTitle;
  String location;
  double salary;

  Employee(this.jobTitle, this.location, this.salary);

  set setSalary(double salary) => this.salary = this.salary + salary;
  double get getSalary => this.salary;

  String toString() =>
      "El empleado trabaja como $jobTitle, en $location y gana $salary";
}
