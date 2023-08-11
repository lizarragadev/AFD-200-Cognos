void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.add(6);
  numbers.add(7);

  numbers.forEach((number) {
    print(number);
  });

  print(numbers);
}
