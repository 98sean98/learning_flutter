void main() {
  var numbers = Iterable.generate(5, (i) => 2 * i);

  for (int i in numbers) {
    print(i); // 0 2 4 6 8
  }

  var list = numbers.toList();
  var set = numbers.toSet();
  var string = numbers.toString();

  print(list); // [0, 2, 4, 6, 8]
  print(set); // {0, 2, 4, 6, 8}
  print(string); // (0, 2, 4, 6, 8)

  print(numbers.firstWhere((x) => x % 3 == 0 && x != 0)); // 6
  print(numbers.skip(2).toList()); // [4, 6, 8]
  print(numbers.take(2).toList()); // [0, 2]
  print(numbers.map((x) => x * 3).toList()); // [0, 6, 12, 18, 24]

  Map<int, int> map = Map.fromIterable(numbers);
  print(map); // {0: 0, 2: 2, 4: 4, 6: 6, 8: 8}
  print(map.map((int key, int value) => MapEntry(key, key + value))); // {0: 0, 2: 4, 4: 8, 6: 12, 8: 16}
}
