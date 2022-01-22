/// Defines the Abstraction's interface that client uses.
abstract class Abstraction {
  String operation();
}

/// Defines the interface for implementation classes.
///
/// This interface does not have to correspond to Abstraction's interface.
/// In fact, the two interfaces can be quite different.
abstract class AbstractImplementor {
  String operationImp(String input);
}

class Foo implements Abstraction {
  final String _text;
  final AbstractImplementor _implementator;

  Foo(this._text, this._implementator);

  @override
  String operation() => _implementator.operationImp('Foo $_text ');
}

class Bar implements AbstractImplementor {
  @override
  String operationImp(String input) => '${input}bar';
}

class Baz implements AbstractImplementor {
  @override
  String operationImp(String input) => '${input}baz'.toUpperCase();
}

