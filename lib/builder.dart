abstract class AbstractBuilder<R> {
  void buildPartA();
  void buildPartB();
  R getResult();
}

class Director<R> {
  final AbstractBuilder _builder;

  Director(this._builder);

  R construct() {
    _builder.buildPartA();
    _builder.buildPartB();
    return _builder.getResult();
  }
}
