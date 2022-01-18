import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/flyweight.dart';
import 'flyweight_test.mocks.dart';

@GenerateMocks([AbstractFlyweight, ExtrinsicState])
void main() {
  late AbstractFlyweight flyweightMock;
  late ExtrinsicState extrinsicStateMock;

  setUp(() {
    flyweightMock = MockAbstractFlyweight();
    extrinsicStateMock = MockExtrinsicState();
  });

  test("object is cached", () {
    var sut = Flyweight('A');

    expect(sut, Flyweight('A'));
    expect(sut, isNot(Flyweight('B')));
  });

  test("operation is called specific number of times", () {
    var sut = UnsharedFlyweight([
      flyweightMock,
      UnsharedFlyweight([flyweightMock, flyweightMock])
    ]);

    sut.operation(extrinsicStateMock);
    verify(flyweightMock.operation(extrinsicStateMock)).called(3);
  });

  test("doSomething is called", () {
    var sut = Flyweight('A');

    sut.operation(extrinsicStateMock);
    verify(extrinsicStateMock.doSomething('A'));
  });
}
