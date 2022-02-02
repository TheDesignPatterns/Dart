import 'package:dp/memento.dart';

void main() {
  var foo = Originator('Foo');
  var caretaker = Caretaker(foo);

  caretaker.rename('Bar');
  print(foo); // Prints "Bar".

  caretaker.rename('Baz');
  print(foo); // Prints "Baz".

  caretaker.undo();
  print(foo); // Prints "Bar".

  caretaker.undo();
  print(foo); // Prints "Foo".
}
