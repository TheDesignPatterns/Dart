import 'package:dp/interpreter.dart';

void main() {
  var expression = Plus(Minus(Var('foo'), Var('bar')), Var('baz'));
  var context = {'foo': 10, 'bar': 20, 'baz': 30};

  var result = expression.interpret(context);

  // Prints "foo - bar + baz = 20, where {foo: 10, bar: 20, baz: 30}".
  print('foo - bar + baz = $result, where $context');
}
