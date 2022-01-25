import 'package:dp/decorator.dart';

void main() {
  var foo = Foo();
  var fooBar = Decorator(foo, 'Bar');
  var fooBarBaz = Decorator(fooBar, 'Baz');

  // Prints "Foo".
  print(foo.operation());

  // Prints "FooBar".
  print(fooBar.operation());

  // Prints "FooBarBaz".
  print(fooBarBaz.operation());
}
