import 'package:dp/bridge.dart';

void main() {
  var fooBar = Foo(' is implemented by ', Bar());
  var fooBaz = Foo(' |=======|=======| ', Baz());

  // Prints "Foo is implemented by bar".
  print(fooBar.operation());

  // Prints "Foo |=======|=======| BAZ".
  print(fooBaz.operation());
}
