import 'dart:async';

void main() async {
//  print('program start');
//  future().then((value) => print(value));
//  print('program end');
  // program start
  // program end
  // delayed call

//  print('program start 2');
//  print(await future());
//  print('program end 2');
  // program start 2
  // delayed call
  // program end

  print('program start 3');
  future().then((value) => print(value));
  event1().then((value) => print(value));
  event2().then((value) => print(value));
  print('program end 3');
  // program start 3
  // program end 3
  // this is a future event
  // this is another future event
  // delayed call

}

// async function declaration
Future future() async {
  Completer completer = Completer();

  Future.delayed(Duration(seconds: 2), () {
    completer.complete('delayed call');
  });

  return completer.future;
}

Future<String> event1() async => Future.value('this is a future event');

Future<String> event2() async => Future.value('this is another future event');
