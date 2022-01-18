/// provides interface for doing specific job having access to both
/// extrinsic and intrinsic states (for stubbing)
abstract class AbstractContext {
  void use(String intrinsicState);
}

/// declares interface through which flyweights can receive and act on extrinsic state
abstract class AbstractFlyweight {
  void operation(AbstractContext context);
}

/// adds storage for intrinsic state, objects of this class must be shareable
class Flyweight implements AbstractFlyweight {
  final String name;

  static final _pool = <String, Flyweight>{};

  factory Flyweight(String name) {
    return _pool.putIfAbsent(name, () => Flyweight._internal(name));
  }

  Flyweight._internal(this.name);

  @override
  void operation(AbstractContext context) {
    context.use(name);
  }
}

/// stores flyweight objects as children
class UnsharedFlyweight implements AbstractFlyweight {
  final List<AbstractFlyweight> _flyweights;

  UnsharedFlyweight(this._flyweights);

  @override
  void operation(AbstractContext context) {
    for (var flyweight in _flyweights) {
      flyweight.operation(context);
    }
  }
}
