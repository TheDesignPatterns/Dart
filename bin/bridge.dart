import 'package:dart/bridge.dart';
import 'dart:io';

class ImplementorA implements AbstractImplementor {
  @override
  void operationImp() => print('specific operation from ImplementorA');
}

class ImplementorB implements AbstractImplementor {
  @override
  void operationImp() => print(this);
}

class RefinedAbstractionX extends AbstractionX {
  RefinedAbstractionX(ImplementorA imp) : super(imp);

  @override
  void operation() {
    stdout.write('Refined operation from AbstractionX is implemented by ');
    super.operation();
  }
}

void main() {
  var abstractionX = RefinedAbstractionX(ImplementorA());
  var abstractionY = AbstractionY(ImplementorB());

  abstractionX.operation();
}
