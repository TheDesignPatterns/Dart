/// ```dart
/// var foo = Foo();
/// var fooBar = Decorator(foo, 'Bar');
/// var fooBarBaz = Decorator(fooBar, 'Baz');
///
/// print(foo.operation()); // Prints "Foo".
/// print(fooBar.operation()); // Prints "FooBar".
/// print(fooBarBaz.operation()); // Prints "FooBarBaz".
/// ```

abstract class AbstractComponent {
  String operation();
}

class Foo implements AbstractComponent {
  @override
  String operation() => 'Foo';
}

class Decorator implements AbstractComponent {
  final AbstractComponent _component;
  final String _name;

  const Decorator(this._component, this._name);

  @override
  String operation() => _component.operation() + _name;
}
