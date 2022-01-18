import 'package:dart/flyweight.dart';

class Context implements AbstractContext {
  @override
  void use(String intrinsicState) => print('$this with $intrinsicState');
}

void main() {
  var flyweightA = Flyweight('A');
  var flyweightB = Flyweight('B');

  var unsharedFlyweight = UnsharedFlyweight([
    flyweightA,
    UnsharedFlyweight([flyweightA, flyweightB])
  ]);

  unsharedFlyweight.operation(Context());
}
