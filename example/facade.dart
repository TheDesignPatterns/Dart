import 'package:dp/facade.dart';

void main() {
  AbstractFacade facade = Facade(SubsystemFactory());

  // Prints "Foo|Bar|Baz";
  print(facade.handle());
}
