import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/flyweight.dart';
import 'flyweight_test.mocks.dart';

@GenerateMocks([AbstractFlyweight])
void main() {
  late AbstractFlyweight flyweightMock;

  setUp(() {
    flyweightMock = MockAbstractFlyweight();
  });

  test('object is cached', () {
    var sut = Flyweight('A');

    expect(sut, Flyweight('A'));
    expect(sut, isNot(Flyweight('B')));
  });

  test('the number of "operation" calls mataches the number of flyweight objects', () {
    var sut = UnsharedFlyweight([
      flyweightMock,
      UnsharedFlyweight([flyweightMock, flyweightMock])
    ]);

    sut.operation(ExtrinsicState.X);
    verify(flyweightMock.operation(ExtrinsicState.X)).called(3);
  });
}
