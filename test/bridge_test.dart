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

      when(barMock.operationImp('Foo => ')).thenReturn('Foo => Bar');
      expect(foo.operation(), 'Foo => Bar');
    });
  });

  group('Implementor', () {
    test('Bar addes "bar" to input string', () {
      var bar = Bar();
      expect(bar.operationImp('Foo '), 'Foo bar');
    });

    test('Baz adds "baz" to input string and upper cases it', () {
      var baz = Baz();
      expect(baz.operationImp('bar '), 'BAR BAZ');
    });
  });
}
