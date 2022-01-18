abstract class AbstractFacade {
  void handle();
}

abstract class AbstractSubsystemX {
  void handle();
}

abstract class AbstractSubsystemY {
  void handle();
}

abstract class AbstractSubsystemZ {
  void handle();
}

abstract class AbstractSubsystemFactory {
  AbstractSubsystemX createX();
  AbstractSubsystemY createY();
  AbstractSubsystemZ createZ();
}

class Facade implements AbstractFacade {
  final AbstractSubsystemX _subsystemX;
  final AbstractSubsystemY _subsystemY;
  final AbstractSubsystemZ _subsystemZ;

  Facade(AbstractSubsystemFactory f)
      : _subsystemX = f.createX(),
        _subsystemY = f.createY(),
        _subsystemZ = f.createZ();

  @override
  void handle() {
    _subsystemX.handle();
    _subsystemY.handle();
    _subsystemZ.handle();
  }
}
