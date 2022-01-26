import 'package:dp/facade.dart';

void main() {
  AbstractFacade facade = Facade(_SubsystemFactory());

  // Prints "Foo.handle|Bar.handle|Baz.handle";
  print(facade.handle());
}

class _SubsystemFactory implements AbstractSubsystemFactory {
  @override
  AbstractSubsystemFoo createFoo() => _SubsystemFoo();
  @override
  AbstractSubsystemBar createBar() => _SubsystemBar();
  @override
  AbstractSubsystemBaz createBaz() => _SubsystemBaz();
}

class _SubsystemFoo implements AbstractSubsystemFoo {
  @override
  String handle() => 'Foo.handle';
}

class _SubsystemBar implements AbstractSubsystemBar {
  @override
  String handle() => 'Bar.handle';
}

class _SubsystemBaz implements AbstractSubsystemBaz {
  @override
  String handle() => 'Baz.handle';
}
