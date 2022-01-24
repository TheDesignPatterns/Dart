import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/bridge.dart';
import 'bridge_test.mocks.dart';

@GenerateMocks([AbstractImplementor])
void main() {
  late AbstractImplementor barMock;

  setUp(() {
      barMock = MockAbstractImplementor();
      when(barMock.operationImp()).thenReturn('Bar');
  });

  test('Foo returns "Foo|==|Bar"', () {
    final foo = Foo('|==|', barMock);
    expect(foo.operation(), 'Foo|==|Bar');
  });

  test('Bar returns "bar"', () {
    final bar = Bar();
    expect(bar.operationImp(), 'bar');
  });

  test('Baz returns "BAZ"', () {
    final baz = Baz();
    expect(baz.operationImp(), 'BAZ');
  });
}
