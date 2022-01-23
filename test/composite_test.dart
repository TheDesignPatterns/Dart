import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/composite.dart';
import 'composite_test.mocks.dart';

@GenerateMocks([AbstractComponent])
void main() {
  test('Foo composes structure from given elements', () {
    var barMock = MockAbstractComponent();
    var foo = Foo([barMock, Foo([barMock, barMock])]);

    when(barMock.operation()).thenReturn('barMock');
    expect(foo.operation(), 'Foo([barMock, Foo([barMock, barMock])])');
  });

  test('Bar returns "Bar()"', () {
    var bar = Bar();
    expect(bar.operation(), 'Bar()');
  });
}
