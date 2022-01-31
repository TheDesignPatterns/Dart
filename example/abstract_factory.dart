import 'package:dp/abstract_factory.dart';

void main() {
  var factories = [Factory1(), Factory2()];
  var foos = [for (var f in factories) f.createFoo()];
  var bars = [for (var f in factories) f.createBar()];

  for (var foo in foos) {
    print(foo.operation()); // Prints: "Foo1.operation" "Foo2.operation".
  }
  for (var bar in bars) {
    print(bar.operation()); // Prints: "Bar1.operation" "Bar2.operation".
  }
}
