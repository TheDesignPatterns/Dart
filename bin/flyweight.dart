import 'package:dart/flyweight.dart';

class ExtrinsicState implements AbstractContext {
  @override
  void doSomething(String intrinsicState) =>
      print('$this with $intrinsicState');
}

void main() {
  var flyweightA = Flyweight('A');
  var flyweightB = Flyweight('B');

  var unsharedFlyweight = UnsharedFlyweight([
    flyweightA,
    UnsharedFlyweight([flyweightA, flyweightB])
  ]);

  unsharedFlyweight.operation(ExtrinsicState());
}
