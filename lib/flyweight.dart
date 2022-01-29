/// ```dart
/// var flyweights = c.Foo([Flyweight('Bar'), c.Foo([Flyweight('Bar'), Flyweight('Baz')])]);
///
/// // Prints "Foo([Flyweight('Bar'), Foo([Flyweight('Bar'), Flyweight('Baz')])])".
/// print(flyweights.operation());
/// ```

import 'composite.dart' as c;

class Flyweight implements c.AbstractComponent {
  final String name; // name represents intrinsic state

  static final _cache = <String, Flyweight>{};

  factory Flyweight(String name) {
    return _cache.putIfAbsent(name, () => Flyweight._internal(name));
  }

  Flyweight._internal(this.name);

  @override
  String operation() => "Flyweight('$name')";
}
