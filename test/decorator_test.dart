import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([AbstractComponent])
void main() {
  late AbstractComponent fooMock;

  setUp(() {
    fooMock = MockAbstractComponent();
    when(fooMock.operation()).thenReturn('Foo');
  });

  test('Foo just returns "Foo"', () {
    final foo = Foo();
    expect(foo.operation(), 'Foo');
  });

  group('Foo is decorated with', () {
    test('"Bar" returning "FooBar"', () {
      final fooMockBar = Decorator(fooMock, 'Bar');
      expect(fooMockBar.operation(), 'FooBar');
    });

    test('"Bar" followed by "Baz" returning "FooBarBaz"', () {
      final fooMockBarBaz = Decorator(Decorator(fooMock, 'Bar'), 'Baz');
      expect(fooMockBarBaz.operation(), 'FooBarBaz');
    });
  });
}
