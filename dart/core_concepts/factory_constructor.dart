void main() {
  Animal a = Animal('cat');
  print(a is Cat); // true
  print(a is Dog); // false
  print(a is Animal); // true

  Animal b = Animal('dog');
  print(b is Dog); // true

  Animal c = Animal('rabbit');
  print(c is Cat); // false

  Item item = Item('first state');
  Item item1 = Item('another state');
  print(item == item1); // true
  print(item.state); // another state
  print(item1.state); // another state

  Item item2 = Item('different state');
  print(item1 == item2); // true
  print(item.state); // different state
  print(item1.state); // different state
  print(item2.state); // different state

}

class Animal {
  String type;

  factory Animal(String type) {
    if (type == 'cat') {
      return Cat(type);
    } else if (type == 'dog') {
      return Dog(type);
    } else {
      return Animal._type(type);
    }
  }

  Animal._type(this.type);
}

class Cat extends Animal {
  String type;
  Cat(String type): super._type(type);
}

class Dog extends Animal {
  String type;
  Dog(String type): super._type(type);
}

class Item {
  static Item item; // could only instantiate 1 instance
  String state;

  factory Item(String state) {
    if (Item.item == null) {
      Item.item = Item._internal()..state = state;
    }
    return Item.item..state = state;
  }

  Item._internal() {

  }
}
