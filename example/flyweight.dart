import 'package:dp/flyweight.dart';
import 'package:dp/composite.dart' as c;

void main() {
  var flyweights = c.Foo([Flyweight('Bar'), c.Foo([Flyweight('Bar'), Flyweight('Baz')])]);

  // Prints "Foo([Flyweight('Bar'), Foo([Flyweight('Bar'), Flyweight('Baz')])])".
  print(flyweights.operation());
}
