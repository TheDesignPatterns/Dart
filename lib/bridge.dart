/// Defines the Abstraction's interface used by client.
abstract class Abstraction {
  void operation();
}

/// Defines the interface for implementation classes.
///
/// This interface does not have to correspond to Abstraction's interface.
/// In fact, the two interfaces can be quite different.
abstract class AbstractImplementor {
  void operationImp();
}

/// Implements interface defined by Abstraction in specific way (aka X)
class AbstractionX implements Abstraction {
  final AbstractImplementor _implementator;

  AbstractionX(this._implementator);

  @override
  void operation() => _implementator.operationImp();
}

/// Implements interface defined by Abstraction in specific way (aka Y)
class AbstractionY implements Abstraction {
  final AbstractImplementor _implementator;

  AbstractionY(this._implementator);

  @override
  void operation() => _implementator.operationImp();
}
