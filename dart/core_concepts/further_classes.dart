void main() {
  var n1 = Complex(3, -4);
  var n2 = Complex(5, 2);
  print(n1 + n2); // 8 - 2i
  print(n1.multiply(n2)); // 23 - 14i
  print(Complex.subtract(n1, n2)); // -2 -6i

  var n3 = Quaternion(1, 2, 3);
  print(n3);
}

class Complex {
  num _real;
  num _imaginary;

  get real => _real;
  set real(num value) => _real = value;

  get imaginary => _imaginary;
  set imaginary(num value) => _imaginary = value;

  Complex(this._real, this._imaginary);

  Complex.real(num real): this(real, 0);
  Complex.imaginary(num imaginary): this(0, imaginary);

  Complex operator +(Complex c) {
    return Complex(this.real + c.real, this.imaginary + c.imaginary);
  }

  Complex multiply(Complex c) {
    return Complex(
      this.real * c.real - this.imaginary * c.imaginary,
      this.real * c.imaginary + this.imaginary * c.real
    );
  }

  // able to access this method without creating a Complex type object
  static Complex subtract(Complex c1, Complex c2) => Complex(c1.real - c2.real, c1.imaginary - c2.imaginary);
  // static methods are not passed down by inheritance

  @override
  String toString() { // toString method
    if (_imaginary >= 0) return '${_real} + ${_imaginary}i';
    else return '${_real} - ${-1 * _imaginary}i';
  }

  @override
  bool operator ==(other) {
    if (!(other is Complex)) return false; // other is not a Complex object, comparison is not possible
    return this._real == other._real && this._imaginary == other._imaginary;
  }
}

class Quaternion extends Complex {
  num jImaginary;

  Quaternion(num real, num imaginary, this.jImaginary): super(real, imaginary); // super calls Complex constructor

  @override
  String toString() {
    return 'overriden quaternion to string method';
  }
}
