import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([AbstractElement])
void main() {
  late AbstractElement fooMock;

  setUp(() {
    fooMock = MockAbstractElement();
    when(fooMock.operation()).thenReturn('Foo');
  });

  group('Decorator', () {
    test('extends given element with "Bar"', () {
      var fooMockBar = Decorator(fooMock, 'Bar');

      expect(fooMockBar.operation(), 'FooBar');
    });

    test('extends given element with "Bar" followed by "Baz"', () {
      var fooMockBarBaz = Decorator(Decorator(fooMock, 'Bar'), 'Baz');

      expect(fooMockBarBaz.operation(), 'FooBarBaz');
    });
  });

  test('Foo returns "Foo"', () {
    var foo = Foo();

    expect(foo.operation(), 'Foo');
  });
}
