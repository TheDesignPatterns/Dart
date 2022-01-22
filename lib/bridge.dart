abstract class Abstraction {
  String operation();
}

abstract class AbstractImplementor {
  String operationImp(String input);
}

class Foo implements Abstraction {
  final String _text;
  final AbstractImplementor _implementor;

  Foo(this._text, this._implementor);

  @override
  String operation() => _implementor.operationImp('Foo$_text');
}

class Bar implements AbstractImplementor {
  @override
  String operationImp(String input) => '${input}bar';
}

class Baz implements AbstractImplementor {
  @override
  String operationImp(String input) => '${input}baz'.toUpperCase();
}
