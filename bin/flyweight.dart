import 'package:dart/flyweight.dart';

void main() {
  var flyweightA = Flyweight('A');
  var flyweightB = Flyweight('B');

  var unsharedFlyweight = UnsharedFlyweight([
    flyweightA,
    UnsharedFlyweight([flyweightA, flyweightB])
  ]);

  unsharedFlyweight.operation(ExtrinsicState.X);
  unsharedFlyweight.operation(ExtrinsicState.Y);
}
