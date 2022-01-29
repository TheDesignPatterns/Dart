import 'package:dp/facade.dart';

void main() {
  var facade = Facade(SubsystemFactory());

  // Prints "Foo.handle|Bar.handle|Baz.handle";
  print(facade.handle());
}
