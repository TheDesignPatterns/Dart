import 'package:dart/decorator.dart';

class Foo implements AbstractElement {
  @override
  Result operation() => 'Foo';
}

void main() {
  var foo = Foo();
  var fooBar = Decorator(foo, 'Bar');
  var fooBarBaz = Decorator(fooBar, 'Baz');

  print(foo.operation());
  print(fooBar.operation());
  print(fooBarBaz.operation());
}
