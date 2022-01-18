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

    Context context = [];
    sut.operation(context);
    verify(flyweightMock.operation(context)).called(3);
  });
}
