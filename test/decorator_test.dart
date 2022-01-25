import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<AbstractComponent<String>>()])
void main() {
  late AbstractComponent fooMock;

  setUp(() {
    fooMock = MockAbstractComponent();
    when(fooMock.operation()).thenReturn('Foo');
  });

  group('Decorator extends given component', () {
    test('with "Bar"', () {
      final fooBar = Decorator(fooMock, 'Bar');
      expect(fooBar.operation(), 'FooBar');
    });

    test('with "Bar" followed by "Baz"', () {
      final fooBarBaz = Decorator(Decorator(fooMock, 'Bar'), 'Baz');
      expect(fooBarBaz.operation(), 'FooBarBaz');
    });
  });

  test('Foo returns "Foo"', () {
    final foo = Foo();
    expect(foo.operation(), 'Foo');
  });
}
