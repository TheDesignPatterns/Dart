/// Decorates given element as shown in the example below
///
/// ```dart
/// void main() {
///   var foo = Foo();
///   var fooBar = Decorator(foo, 'Bar');
///   var fooBarBaz = Decorator(fooBar, 'Baz');
///
///   print(foo.operation()); // Prints "Foo".
///   print(fooBar.operation()); // Prints "FooBar".
///   print(fooBarBaz.operation()); // Prints "FooBarBaz".
/// }
/// ```

abstract class AbstractComponent<R> {
  R operation();
}

class Foo implements AbstractComponent<String> {
  @override
  String operation() => 'Foo';
}

class Decorator implements AbstractComponent<String> {
  final AbstractComponent _element;
  final String _name;

  const Decorator(this._element, this._name);

  @override
  String operation() => _element.operation() + _name;
}
