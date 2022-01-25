import 'package:dart/flyweight.dart';

void main() {
  var unsharedFlyweight = Foo([Flyweight('Bar'), Foo([Flyweight('Bar'), Flyweight('Baz')])]);

  // Prints "Foo([Flyweight('Bar'), Foo([Flyweight('Bar'), Flyweight('Baz')])])".
  print(unsharedFlyweight.operation());
}
