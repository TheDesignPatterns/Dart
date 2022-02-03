import 'package:dp/bridge.dart';

void main() {
  var fooBar = Foo('is implemented by', Bar());
  var fooBaz = Foo('|=======|=======|', Baz());

  print(fooBar.operation()); // Prints "Foo is implemented by bar".
  print(fooBaz.operation()); // Prints "Foo |=======|=======| BAZ".
}
