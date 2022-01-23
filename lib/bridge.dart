abstract class Abstraction {
  String operation();
}

abstract class AbstractImplementor {
  String operationImp();
}

class Foo implements Abstraction {
  final String _name;
  final AbstractImplementor _implementor;

  Foo(this._name, this._implementor);

  @override
  String operation() => 'Foo$_name${_implementor.operationImp()}';
}

class Bar implements AbstractImplementor {
  @override
  String operationImp() => 'bar';
}

class Baz implements AbstractImplementor {
  @override
  String operationImp() => 'baz'.toUpperCase();
}
