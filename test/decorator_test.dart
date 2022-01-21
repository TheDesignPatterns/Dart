import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/decorator.dart';
import 'decorator_test.mocks.dart';

@GenerateMocks([AbstractElement])
void main() {
  late AbstractElement elementMock;

  setUp(() {
    elementMock = MockAbstractElement();
  });

  test('"Foo" is decorated by "Bar"', () {
    var sut = Decorator(elementMock, 'Bar');

    when(elementMock.operation()).thenReturn('Foo');
    expect(sut.operation(), 'FooBar');
  });

  test('"Foo" is decorated by "Bar" followed by "Baz"', () {
    var sut = Decorator(Decorator(elementMock, 'Bar'), 'Baz');

    when(elementMock.operation()).thenReturn('Foo');
    expect(sut.operation(), 'FooBarBaz');
  });
}
