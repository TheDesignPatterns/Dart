import 'package:dart/composite.dart' as c;
export 'package:dart/composite.dart' hide Bar;

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
