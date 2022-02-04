import 'package:dp/strategy.dart';

void main() {
  var contextWithFooStrategy = Context(StrategyFoo());
  var contextWithBarStrategy = Context(StrategyBar());

  print(contextWithFooStrategy.operation()); // Prints "StrategyFoo.algorithm".
  print(contextWithBarStrategy.operation()); // Prints "StrategyBar.algorithm".
}
