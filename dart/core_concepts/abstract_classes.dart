import 'dart:math'; // to access pi constant

void main() {
  var c = Circle(5);
  var r = Rectangle(10.3, 4.5);
  var s = Square(6.2);

  print(c.name);
  print(r.name);
  print(s.name);

  Shape shape;
  Random random = Random();
  int choice = random.nextInt(3); // 0 1 or 2

  switch(choice) {
    case 0:
      shape = Circle(
        randomDimension()
        );
      break;
    case 1:
      shape = Rectangle(
        randomDimension(),
        randomDimension()
        );
      break;
    case 2:
      shape = Square(
        randomDimension()
        );
      break;
    default:
      print('should never execute');
  }

  print(shape.name);

  var a = A();
  a.hello(); // hello from A

  A c1 = C();
  print(c1.hello()); // hello from C
  // c1.goodbye(); // method not defined for class A
  print((c1 as B).goodbye()); // goodbye from C
  // c1 is casted as B
  print((c1 as C).goodbye()); // goodbye from C
  // c1 is casted as C
  // print(c1.time()); // not defined for class A
  print((c1 as C).time); // some DateTime value
}

double randomDimension() => Random().nextInt(10) + 1.0;

class TimeStamp {
  DateTime timestamp = DateTime.now();

  DateTime get time => timestamp;
}

class A {
  String hello() => 'hello from A';
}

class B {
  String goodbye() => 'good bye from B';
}

class C with TimeStamp implements Shape, A, B { // mixin TimeStamp and implements Shape, A, B classes
  @override
  String hello() => 'hello from C';

  @override
  String goodbye() => 'goodbye from C';

  @override
  double get perimeter => 0;

  @override
  double get area => 0;

  @override
  String get name => 'I am C';
}

abstract class Shape { // acts as an interface for a class
  double get perimeter;
  double get area;
  String get name;
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double get perimeter => 2 * pi * radius;

  @override
  double get area => pi * radius * radius;

  @override
  String get name => 'I am a circle with radius $radius';
}

class Rectangle extends Shape {
  double length, width;

  Rectangle(this.length, this.width);

  @override
  double get perimeter => 2 * (length + width);

  @override
  double get area => length * width;

  @override
  String get name => 'I am a rectangle with length $length and width $width';
}

class Square extends Rectangle {
  Square(double side): super(side, side);

  @override
  String get name => 'I am a square with length $length';
}
