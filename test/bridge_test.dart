import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/bridge.dart';
import 'bridge_test.mocks.dart';

@GenerateMocks([AbstractImplementer])
void main() {
  late AbstractImplementer barMock;

  setUp(() {
      barMock = MockAbstractImplementer();
      when(barMock.operationImp()).thenReturn('Bar');
  });

  test('Foo is implemented by Bar', () {
    final foo = Foo('is implemented by', barMock);
    expect(foo.operation(), 'Foo is implemented by Bar');
  });

  test('Bar just returns "bar"', () {
    final bar = Bar();
    expect(bar.operationImp(), 'bar');
  });

  test('Baz just returns "BAZ"', () {
    final baz = Baz();
    expect(baz.operationImp(), 'BAZ');
  });
}
