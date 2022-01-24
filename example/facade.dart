import 'package:dart/facade.dart';

void main() {
  AbstractFacade facade = Facade(SubsystemFactory());

  // Prints "Foo|Bar|Baz";
  print(facade.handle());
}
