import 'dart:isolate';

void main() {
  Isolate.spawn(messenger, 'this is from the isolate');
  print('from main');
  // from main
  // this is from the isolate

  ReceivePort rPort = ReceivePort();
  rPort.listen((data) {
    if (data is String) {
      print(data);
    } else {
      print('pi is $data');
      rPort.close();
    }
  });
  
  Isolate.spawn(calculatePi, rPort.sendPort);
  // can only receive messages from calculatePi isolate
  // cannot send messages to isolate
}

void messenger(String message) => print(message);

void calculatePi(SendPort sPort) {
  int iterations = 1000000000;
  double s = 1.0;
  double den = 3.0;
  double neg = -1.0;

  for (int i = 0; i < iterations; i++) {
    s += neg * (1 / den);
    den += 2.0;
    neg *= -1.0;
    if ((i / iterations == 0.25) || (i / iterations == 0.5) || (i / iterations == 0.75)) {
      sPort.send('${i / iterations * 100}% complete');
    }
  }

  double pi = 4 * s;
  sPort.send(pi);
}
