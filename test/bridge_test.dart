import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/bridge.dart';
import 'bridge_test.mocks.dart';

@GenerateMocks([AbstractImplementator])
void main() {
  late AbstractImplementator implementator;

  setUp(() {
    implementator = MockAbstractImplementator();
  });

  test("operationImp is called", () {
    var sut = AbstractionX(implementator);

    sut.operation();
    verify(implementator.operationImp());
  });

  test("operationImp is called", () {
    var sut = AbstractionX(implementator);

    sut.operation();
    verify(implementator.operationImp());
  });
}
