/// ```dart
/// var foo = Originator('Foo');
/// var caretaker = Caretaker(foo);
///
/// caretaker.rename('Bar');
/// print(foo); // Prints "Bar"
///
/// caretaker.rename('Baz');
/// print(foo); // Prints "Baz"
///
/// caretaker.undo();
/// print(foo); // Prints "Bar"
///
/// caretaker.undo();
/// print(foo); // Prints "Foo"
/// ```

class Memento {
  final String _name;

  Memento(this._name);

  String get name => _name;
}

class Originator {
  String _name;

  Originator(this._name);

  Memento createMemento() => Memento(_name);
  void setMemento(Memento memento) => _name = memento.name;

  set rename(String name) => _name = name;

  @override
  String toString() => _name;
}

class Caretaker {
  final Originator _originator;
  final _mementos = <Memento>[];

  Caretaker(this._originator);

  void rename(String name) {
    _mementos.add(_originator.createMemento());
    _originator.rename = name;
  }

  void undo() => _originator.setMemento(_mementos.removeLast());
}
