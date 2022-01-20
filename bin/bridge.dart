import 'package:dart/bridge.dart';
import 'dart:io';

class ImplementatorA implements AbstractImplementator {
  @override
  void operationImp() => print(this);
}

class ImplementatorB implements AbstractImplementator {
  @override
  void operationImp() => print('$this provides implementation');
}

class RefinedAbstractionX extends AbstractionX {
  RefinedAbstractionX(ImplementatorA imp) : super(imp);

  @override
  void operation() {
    stdout.write('$this implemented by ');
    super.operation();
  }
}

void main() {
  var abstractionX = RefinedAbstractionX(ImplementatorA());
  var abstractionY = AbstractionY(ImplementatorB());

  abstractionX.operation();
  abstractionY.operation();
}
