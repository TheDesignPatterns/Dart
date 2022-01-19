enum ExtrinsicState { X, Y }
typedef IntrinsicState = String;

/// declares interface through which flyweights can receive and act on extrinsic state
abstract class AbstractFlyweight {
  void operation(ExtrinsicState extrinsicState);
}

/// adds storage for intrinsic state, objects of this class must be shareable
class Flyweight implements AbstractFlyweight {
  final IntrinsicState _key; // key represents intrinsic state

  static final _cache = <IntrinsicState, Flyweight>{};

  factory Flyweight(IntrinsicState _key) {
    return _cache.putIfAbsent(_key, () => Flyweight._internal(_key));
  }

  Flyweight._internal(this._key);

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
