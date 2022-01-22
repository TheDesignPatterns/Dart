import 'package:dart/bridge.dart';

void main() {
  var fooBar = Foo('is implemented by', Bar());
  var fooBaz = Foo('=>', Baz());

  // prints "Foo is implemented by bar"
  print(fooBar.operation());

  // prints "FOO => BAZ"
  print(fooBaz.operation());
}
