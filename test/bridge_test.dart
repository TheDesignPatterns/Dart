import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/bridge.dart';
import 'bridge_test.mocks.dart';

@GenerateMocks([AbstractImplementor])
void main() {
  late AbstractImplementor implementor;

  setUp(() {
    implementor = MockAbstractImplementor();
  });

  test("operationImp is called", () {
    var sut = RefinedAbstraction(implementor);

    sut.operation();
    verify(implementor.operationImp());
  });
}
