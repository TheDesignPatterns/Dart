import 'package:dart/facade.dart';

class SubsystemX implements AbstractSubsystemX {
  @override
  void handle() => print(this);
}

class SubsystemY implements AbstractSubsystemY {
  @override
  void handle() => print(this);
}

class SubsystemZ implements AbstractSubsystemZ {
  @override
  void handle() => print(this);
}

class SubsystemFactory implements AbstractSubsystemFactory {
  @override
  AbstractSubsystemX createX() => SubsystemX();
  @override
  AbstractSubsystemY createY() => SubsystemY();
  @override
  AbstractSubsystemZ createZ() => SubsystemZ();
}

void main() {
  AbstractFacade facade = Facade(SubsystemFactory());

  facade.handle();
}
