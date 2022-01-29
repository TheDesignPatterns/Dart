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

  test('Foo reflects composition of given components in form of a string', () {
    final foo = Foo([barMock, Foo([barMock, barMock])]);
    expect(foo.operation(), 'Foo([barMock, Foo([barMock, barMock])])');
  });

  test('Bar just returns "Bar()"', () {
    final bar = Bar();
    expect(bar.operation(), 'Bar()');
  });
}
