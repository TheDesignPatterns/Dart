enum ExtrinsicState { X, Y }
typedef IntrinsicState = String;

/// declares interface through which flyweights can receive and act on extrinsic state
abstract class AbstractFlyweight {
  void operation(ExtrinsicState extrinsicState);
}

/// adds storage for intrinsic state, objects of this class must be shareable
class Flyweight implements AbstractFlyweight {
  final IntrinsicState key; // key represents intrinsic state

  static final _cache = <IntrinsicState, Flyweight>{};

  factory Flyweight(IntrinsicState key) {
    return _cache.putIfAbsent(key, () => Flyweight._internal(key));
  }

  Flyweight._internal(this.key);

  @override
  void operation(ExtrinsicState extrinsicState) => print(this);
}

/// stores flyweight objects as structure
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
