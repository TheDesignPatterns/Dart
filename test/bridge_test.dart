import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/bridge.dart';
import 'bridge_test.mocks.dart';

@GenerateMocks([AbstractImplementor])
void main() {
  group('Abstraction', () {
    test('Foo propagates input/output to/from implementor', () {
      var barMock = MockAbstractImplementor();
      var foo = Foo('=>', barMock);

      when(barMock.operationImp()).thenReturn('Bar');
      expect(foo.operation(), 'Foo=>Bar');
    });
  });

  group('Implementor', () {
    test('Bar returns "bar"', () {
      var bar = Bar();
      expect(bar.operationImp(), 'bar');
    });

    test('Baz returns "baz" in upper case', () {
      var baz = Baz();
      expect(baz.operationImp(), 'BAZ');
    });
  });
}
