import 'package:dp/prototype.dart';

void main() {
  var foo = Prototype('foo');
  var fooClone = foo.clone();

  print(foo); // Prints "foo".
  print(fooClone); // Prints "fooClone".
}
