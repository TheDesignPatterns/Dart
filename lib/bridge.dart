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
  final AbstractImplementor _implementor;

  Foo(this._name, this._implementor);

  @override
  String operation() => 'Foo$_name${_implementor.operationImp()}';
}

abstract class AbstractImplementor {
  String operationImp();
}

class Bar implements AbstractImplementor {
  @override
  String operationImp() => 'bar';
}

class Baz implements AbstractImplementor {
  @override
  String operationImp() => 'baz'.toUpperCase();
}
