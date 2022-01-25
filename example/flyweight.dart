import 'package:dp/flyweight.dart';
import 'package:dp/composite.dart';

void main() {
  var flyweights = Foo([Flyweight('Bar'), Foo([Flyweight('Bar'), Flyweight('Baz')])]);

  // Prints "Foo([Flyweight('Bar'), Foo([Flyweight('Bar'), Flyweight('Baz')])])".
  print(flyweights.operation());
}
