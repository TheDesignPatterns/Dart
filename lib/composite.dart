abstract class AbstractComponent {
  String operation();
}

class Composite implements AbstractComponent {
  final List<AbstractComponent> _components;

  Composite(this._components);

  @override
  String operation() {
    var result = 'Composite([';
    for (var i = 0; i < _components.length - 1; i++) {
      result += '${_components[i].operation()}, ';
    }
    return '$result${_components.last.operation()}])';
  }
}

class Bar implements AbstractComponent {
  @override
  String operation() => 'Bar()';
}
