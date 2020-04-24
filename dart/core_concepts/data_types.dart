void main () {
  int x = 10;
  double y = 10.0;

  String s = "${x + y}"; // 20.0 as a string
  print(s); // 20.0

  bool b = false;
  print(b); // false

  List l = [5,7,9]; // automatically infer as List of integers
  print(l[1]); // 7

  List l_combined = [1.0, 2, "something"]; // this is allowed
  print(l_combined); // [1.0, 2, something]

  List<String> ls = ['a string', 'another string'];
  print(ls[0]); // another string

  ls[1] = 'changed string';
  print(ls); // [a string, another string]

  // ls[0] = 1; // error: int cannot be assigned to String List

  Map<String, int> map = { // set map with key type String and value type int
    "A": 1,
    "B": 2,
    "C": 3
  };
  print(map['A']); // 1

  print(sum(4,7)); // 11

  print(global_x); // 10

  fun = add; // puts add into a reference Function fun
  print(fun(5, 10)); // 15

  int result = exec(fun, 4, -1);
  print(result); // 3

  List<Function> operators = [add, add_arrow];
  print(operators[1](-4, -9)); // -13
}

int global_x = 10;

// functions are stored as objects
int sum(int a, int b) {
  return a + b;
}

add(a, b) { // this works too but the compiler has to manually infer the type, which takes time
  return a + b;
}

Function fun; // global function

exec(Function op, x, y) { // pass an op Function as an argument
  return op(x, y);
}

add_arrow(a, b) => a + b;
