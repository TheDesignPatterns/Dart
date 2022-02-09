// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// ```dart
/// var foo = Prototype('foo');
/// var fooClone = foo.clone();
///
/// print(foo); // Prints "foo".
/// print(fooClone); // Prints "fooClone".
/// ```

abstract class AbstractPrototype {
  AbstractPrototype clone();
}

class Prototype implements AbstractPrototype {
  final String _name;

  Prototype(this._name);
  Prototype.from(Prototype p) : _name = p._name + "Clone";

  @override
  AbstractPrototype clone() => Prototype.from(this);

  @override
  String toString() => _name;
}
