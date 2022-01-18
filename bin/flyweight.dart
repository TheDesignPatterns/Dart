import 'package:dart/flyweight.dart';

class State implements ExtrinsicState {
  @override
  void doSomething(String intrinsicState) => print('$this with $intrinsicState');
}

void main() {
	var flyweightA = Flyweight('A');
	var flyweightB = Flyweight('B');

	var unsharedFlyweight = UnsharedFlyweight([
		flyweightA,
		UnsharedFlyweight([
			flyweightA,
			flyweightB
		])
	]);

	unsharedFlyweight.operation(State());
}
