main() {
  print(age(10));
  print(age(20));
  print(age(30));
  print(age(40));
}

bool age(x) {
  if (x >= 18)
    return true;
  else
    return false;
}
