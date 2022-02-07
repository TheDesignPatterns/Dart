import 'package:dp/visitor.dart';

void main() {
  var visitor1 = Visitor1();
  var visitor2 = Visitor2();

  for (var element in [Foo(), Bar(), Bar(), Foo()]) {
    element.accept(visitor1);
    element.accept(visitor2);
  }

  print(visitor1); // Prints "visited [Foo, Bar, Bar, Foo]".
  print(visitor2); // Prints "visited [Foo, Foo][Bar, Bar]".
}
