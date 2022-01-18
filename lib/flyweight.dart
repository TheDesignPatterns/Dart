/// provides interface for doing specific job having access to both
/// extrinsic and intrinsic states (for stubbing)
abstract class ExtrinsicState {
  void doSomething(String intrinsicState);
}

/// declares interface through which flyweights can receive and act on extrinsic state
abstract class AbstractFlyweight {
  void operation(ExtrinsicState extrinsicState);
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
  void operation(ExtrinsicState extrinsicState) {
    extrinsicState.doSomething(name);
  }
}

/// stores flyweight objects as children
class UnsharedFlyweight implements AbstractFlyweight {
  final List<AbstractFlyweight> _flyweights;

  UnsharedFlyweight(this._flyweights);

  @override
  void operation(ExtrinsicState extrinsicState) {
    for (var flyweight in _flyweights) {
      flyweight.operation(extrinsicState);
    }
  }
}
