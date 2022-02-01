/// ```dart
/// var fooBar = Foo(' is implemented by ', Bar());
/// var fooBaz = Foo(' |=======|=======| ', Baz());
///
/// // Prints "Foo is implemented by bar".
/// print(fooBar.operation());
///
/// // Prints "Foo |=======|=======| BAZ".
/// print(fooBaz.operation());
/// ```

abstract class Abstraction {
  String operation();
}

class Foo implements Abstraction {
  final String _name;
  final AbstractImplementer _implementer;

  Foo(this._name, this._implementer);

  @override
  String operation() => 'Foo$_name${_implementer.operationImp()}';
}

abstract class AbstractImplementer {
  String operationImp();
}

class Bar implements AbstractImplementer {
  @override
  String operationImp() => 'bar';
}

class Baz implements AbstractImplementer {
  @override
  String operationImp() => 'baz'.toUpperCase();
}
