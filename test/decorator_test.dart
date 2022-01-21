import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([AbstractElement])
void main() {
  late AbstractElement foo;

  setUp(() {
    foo = MockAbstractElement();
    when(foo.operation()).thenReturn('Foo');
  });

  test('"Foo" is decorated by "Bar"', () {
    var fooBar = Decorator(foo, 'Bar');

    expect(fooBar.operation(), 'FooBar');
  });

  test('element "Foo" is decorated by "Bar" followed by "Baz"', () {
    var fooBarBaz = Decorator(Decorator(foo, 'Bar'), 'Baz');

    expect(fooBarBaz.operation(), 'FooBarBaz');
  });
}
