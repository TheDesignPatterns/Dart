import 'package:dart/bridge.dart';
import 'dart:io';

class Bar implements AbstractImplementor {
  @override
  void operationImp() => print('Bar');
}

class Baz implements AbstractImplementor {
  @override
  void operationImp() => print('Baz');
}

class Foo extends RefinedAbstraction {
  Foo(AbstractImplementor imp) : super(imp);

  @override
  void operation() {
    stdout.write('Foo implemented by ');
    super.operation();
  }
}

void main() {
  var fooBar = Foo(Bar());
  var fooBaz = Foo(Baz());

  fooBar.operation(); // prints Foo implemented by Bar
  fooBaz.operation(); // prints Foo implemented by Baz
}
