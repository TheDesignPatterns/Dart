/// ```dart
/// var contextWithFooStrategy = Context(StrategyFoo());
/// var contextWithBarStrategy = Context(StrategyBar());
///
/// print(contextWithFooStrategy.operation()); // Prints "StrategyFoo.algorithm".
/// print(contextWithBarStrategy.operation()); // Prints "StrategyBar.algorithm".
/// ```

abstract class AbstractStrategy {
  String algorithm();
}

class StrategyFoo implements AbstractStrategy {
  @override
  String algorithm() => "StrategyFoo.algorithm";
}

class StrategyBar implements AbstractStrategy {
  @override
  String algorithm() => "StrategyBar.algorithm";
}

class Context {
  final AbstractStrategy _strategy;

  Context(this._strategy);

  String operation() => _strategy.algorithm();
}
