import 'package:async_structures/async_structures.dart' as async_structures;
import 'dart:async';

void main(List<String> arguments) async {
  var a = await loadString('hello this is from a future');
  print(a);

  var b = await asyncLoadString('hello this is from another future'); // only runs after print(a) is executed
  print(b);
  
  await asyncAdd(14).then((f) => f(18)).then((result) => print(result));
  // delays 500ms, prints 'x: 14', delays 1s, prints 'y: 18', prints '32'
}

Future<String> loadString(String str) {
  return Future.delayed(Duration(seconds: 2)).then((_) {
    return 'String: $str';
  });
}

Future<String> asyncLoadString(String str) async {
  await Future.delayed(Duration(seconds: 1)); // returns a Future just to delay by 1 second
  return 'String async: $str';
}

Future<Function> asyncAdd(int x) async {
  await Future.delayed(Duration(milliseconds: 500));
  print('x: $x');
  return (int y) async {
    await Future.delayed(Duration(seconds: 1));
    print('y: $y');
    return x + y;
  };
}
