import 'package:dart/decorator.dart';

class Element implements AbstractElement {
  final String _name;

  const Element(this._name);

  @override
  Result operation() => _name;
}

void main() {
  AbstractElement foo = Element('Foo');
  AbstractElement fooBar = Decorator(foo, 'Bar');
  AbstractElement fooBarBaz = Decorator(fooBar, 'Baz');

  print(foo.operation());
  print(fooBar.operation());
  print(fooBarBaz.operation());
}
