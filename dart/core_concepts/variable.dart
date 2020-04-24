void main() {
  var x = 5; // x has been inferred as an int type
  // x = "5"l // this is an error

  dynamic y = 5; // most general type in dart, but not recommended due to low perforamnce
  y = "5";

  var l = [ // l is a inferred List<Object>
    1,
    "2",
    3.0,
    () {},
    [1,2,3],
    {"A": 1}
  ];

  // dynamic -> generalizes all Types
  // Object => All Types are derived from Object
  // dynamic and Object are not efficient

  print("a string $x"); // a string 5
  print("a string \$x"); // a string $x

  // dart is a object-oriented and class-based proramming language
}
