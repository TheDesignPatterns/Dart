abstract class AbstractComponent {
  String operation();
}

class Foo implements AbstractComponent {
  final List<AbstractComponent> _components;

  Foo(this._components);

  @override
  String operation() {
    var result = 'Foo([';
    for (var i = 0; i < _components.length-1; i++) {
      result += '${_components[i].operation()}, ';
    }
    return '$result${_components.last.operation()}])';
  }
}

class Bar implements AbstractComponent {
  @override
  String operation() => 'Bar()';
}

