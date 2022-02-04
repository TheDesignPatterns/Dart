/// ```dart
/// var contextWithFooStrategy = Context(FooStrategy());
/// var contextWithBarStrategy = Context(BarStrategy());
///
/// print(contextWithFooStrategy.operation()); // Prints "FooStrategy.algorithm".
/// print(contextWithBarStrategy.operation()); // Prints "BarStrategy.algorithm".
/// ```

abstract class AbstractStrategy {
  String algorithm();
}

class FooStrategy implements AbstractStrategy {
  @override
  String algorithm() => "FooStrategy.algorithm";
}

class BarStrategy implements AbstractStrategy {
  @override
  String algorithm() => "BarStrategy.algorithm";
}

class Context {
  final AbstractStrategy _strategy;

  Context(this._strategy);

  String operation() => _strategy.algorithm();
}
