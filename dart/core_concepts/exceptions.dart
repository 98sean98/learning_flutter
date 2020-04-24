import 'dart:io';

void main() {
  int index;

  List<String> names = ['Amy', 'Beatrice', 'Cindy', 'Dawn'];

  String input;

  print('enter an integer: ');
  input = stdin.readLineSync();

  try {
    index = int.parse(input);
    print(names[index]);
  } on FormatException { // cannot parse string input into int
    print('could not parse input');
  } on RangeError {
    print('out of range');
  } finally {
    print('You selected $index out of ${names.length}');
  }

  Pub pub = Pub();
  try {
    pub.checkAge(Person('john', 41));
    pub.checkAge(Person('george', 13));
    pub.checkAge(Person('sarah', 39));
  } catch (e) {
    print(e); // george is too young for the pub!
  } finally {
    print(pub.drinking); // [john, 41]
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => '$name, $age';
}

class Pub {
  List<Person> drinking = List();

  void checkAge(Person p) {
    if (p.age < 18) {
      throw TooYoungException(p);
    } else {
      drinking.add(p);
    }
  }
}

class TooYoungException implements Exception {
  Person p;

  TooYoungException(this.p);

  @override
  String toString() => '${p.name} is too young for the pub!';
}
