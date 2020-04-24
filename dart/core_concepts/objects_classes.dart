void main() {
  num x = 1; // num is a parent of int and double
  x = 6.5;

  var c = Complex(5, 2); // Complex() is a class constructor
  print(c); // Instance of 'Complex' without the @override toString, 5 + 2i with @override toString
  print('${c.real} + ${c.imaginary}i'); // 5 + 2i

  var d = Complex(5, 2);
  print(c == d); // true

  var r = Complex.real(10);
  var i = Complex.imaginary(-5);
  print(r); // 10 + 0i
  print(i); // 0 - 5i
}

class Complex {
  num real;
  num imaginary;

  // add an _ to the start of the name of the variable
  num _private; // private entity that cannot be accessed if Complex class is written in a different file from main


  // Complex(num real, num imaginary) {
  //   this.real = real; // this object's real is assigned as argument real
  //   this.imaginary = imaginary;
  // }

  Complex(this.real, this.imaginary);

  // named constructors
  Complex.real(num real): this(real, 0); // this refers to Complex(this.real, this.imaginary) constructor
  Complex.imaginary(num imaginary): this(0, imaginary); // : is an initialiser

  @override
  String toString() { // toString method
    if (imaginary >= 0) return '${real} + ${imaginary}i';
    else return '${real} - ${-1 * imaginary}i';
  }

  @override
  bool operator ==(other) {
    if (!(other is Complex)) return false; // other is not a Complex object, comparison is not possible
    return this.real == other.real && this.imaginary == other.imaginary;
  }
}
