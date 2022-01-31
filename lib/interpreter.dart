/// ```dart
/// var expression = Plus(Minus(Var('foo'), Var('bar')), Var('baz'));
/// var context = {'foo': 10, 'bar': 20, 'baz': 30};
///
/// var result = expression.interpret(context);
///
/// // Prints "foo - bar + baz = 20, where {foo: 10, bar: 20, baz: 30}".
/// print('foo - bar + baz = $result, where $context');
/// ```

typedef Context = Map<String, int>;

abstract class AbstractExpression {
  int interpret(Context context);
}

class Var implements AbstractExpression {
  final String _value;

  Var(this._value);

  @override
  int interpret(Context context) => context.putIfAbsent(_value, () => 0);
}

class Plus implements AbstractExpression {
  final AbstractExpression _left, _right;

  Plus(this._left, this._right);

  @override
  int interpret(Context context) =>
      _left.interpret(context) + _right.interpret(context);
}

class Minus implements AbstractExpression {
  final AbstractExpression _left, _right;

  Minus(this._left, this._right);

  @override
  int interpret(Context context) =>
      _left.interpret(context) - _right.interpret(context);
}
