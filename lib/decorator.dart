abstract class AbstractElement {
  String operation();
}

class Decorator implements AbstractElement {
  final AbstractElement _element;
  final String _name;

  const Decorator(this._element, this._name);

  @override
  String operation() => '${_element.operation()}$_name';
}

class Foo implements AbstractElement {
  @override
  String operation() => 'Foo';
}
