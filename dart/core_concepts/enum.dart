void main() {
  generic<String> s = generic(4, 'hi', Status.running);
  s.prints(); // hi hi hi hi

  generic<generic> higher = generic(2, s, Status.running);
  higher.prints(); // Instance of 'generic<String>' Instance of 'generic<String>'

  print(sum(10, 12.4)); // 22.4

  generic(3, 5.4, Status.paused).prints(); // item stopped; status Status.paused; times 3
}

enum Status {
  // indexed starting from 0
  running, // 0
  stopped, // 1
  paused // 2
}

class generic<T> {
  int times;
  T item;
  Status status;

  generic(this.times, this.item, this.status);

  void prints() {
    if (status.index == 0) {
      for (int i = 0; i < times; i++) {
        print(item);
      }
    } else {
      print('item stopped; status ${status}; times $times');
    }
  }
}

T sum<T extends num, S extends num>(T a, S b) => a + b;
