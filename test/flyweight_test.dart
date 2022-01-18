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

  test("verify fly", () {
    var sut = Flyweight('A');

    expect(sut, Flyweight('A'));
    expect(sut, isNot(Flyweight('B')));
  });

  test("verify operation", () {
    var sut = UnsharedFlyweight([
      flyweightMock,
      UnsharedFlyweight([
        flyweightMock,
        flyweightMock
      ])
    ]);

    sut.operation(extrinsicStateMock);
    verify(flyweightMock.operation(extrinsicStateMock)).called(3);
  });
}
