import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/composite.dart';
import 'composite_test.mocks.dart';

@GenerateMocks([AbstractComponent])
void main() {
  late AbstractComponent barMock;

  setUp(() {
    barMock = MockAbstractComponent();
    when(barMock.operation()).thenReturn('barMock');
  });

  test('Foo composes structure from given elements', () {
    final foo = Foo([barMock, Foo([barMock, barMock])]);
    expect(foo.operation(), 'Foo([barMock, Foo([barMock, barMock])])');
  });

  test('Bar returns "Bar()"', () {
    final bar = Bar();
    expect(bar.operation(), 'Bar()');
  });
}
