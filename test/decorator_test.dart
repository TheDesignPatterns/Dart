import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([AbstractComponent])
void main() {
  late AbstractComponent foo;

  setUp(() {
    foo = MockAbstractComponent();
    when(foo.operation()).thenReturn('Foo');
  });

  test('Foo just returns "Foo"', () {
    final foo = Foo();
    expect(foo.operation(), 'Foo');
  });

  group('Foo is decorated with', () {
    test('"Bar" returning "FooBar"', () {
      final fooBar = Decorator(foo, 'Bar');
      expect(fooBar.operation(), 'FooBar');
    });

    test('"Bar" followed by "Baz" returning "FooBarBaz"', () {
      final fooBarBaz = Decorator(Decorator(foo, 'Bar'), 'Baz');
      expect(fooBarBaz.operation(), 'FooBarBaz');
    });
  });
}
