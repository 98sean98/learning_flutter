void main() {
  bool b = true;
  bool c = false;

  if (b) print(true);

  if (b) print('someething');
  else if (c) print('another thing');
  else print('nothing');

  // == != > < >= <= !

  int x = 0;
  while (x < 4) print(x++); // 0 1 2 3

  for(int x = 10; x > 5; x--) print(--x); // 9 7 5
}
