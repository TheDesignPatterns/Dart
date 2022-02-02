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

  String get state => _name;
}

class Originator {
  String _name;

  Originator(this._name);

  Memento createMemento() => Memento(_name);
  void setMemento(Memento memento) => _name = memento.state;

  set moveString(String state) => _name = state;

  @override
  String toString() => '$_name';
}

class Caretaker {
  final Originator _originator;
  final _mementos = <Memento>[];

  Caretaker(this._originator);

  void rename(String state) {
    _mementos.add(_originator.createMemento());
    _originator.moveString = state;
  }

  void undo() => _originator.setMemento(_mementos.removeLast());
}
