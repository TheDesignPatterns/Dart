abstract class AbstractComponent<R> {
  R operation();
}

class Foo implements AbstractComponent<String> {
  @override
  String operation() => 'Foo';
}

class Decorator implements AbstractComponent<String> {
  final AbstractComponent _element;
  final String _name;

  const Decorator(this._element, this._name);

  @override
  String operation() => _element.operation() + _name;
}
