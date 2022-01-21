typedef Result = String;

abstract class AbstractElement {
  Result operation();
}

class Decorator implements AbstractElement {
  final AbstractElement _element;
  final String _name;

  const Decorator(this._element, this._name);

  @override
  Result operation() => '${_element.operation()}$_name';
}
