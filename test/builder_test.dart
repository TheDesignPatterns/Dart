import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/builder.dart';
import 'builder_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<AbstractBuilder<String>>()])
void main() {
  late AbstractBuilder builderMock;

  setUp(() {
    builderMock = MockAbstractBuilder();
    when(builderMock.getResult()).thenReturn('foo');
  });

  test('Director constructs object by calling builder methods in proper order', () {
    final director = Director(builderMock);
    expect(director.construct([Token(Type.A, 'xxx'), Token(Type.B, 'yyy')]), 'foo');
    verifyInOrder([
      builderMock.buildPartA('xxx'),
      builderMock.buildPartB('yyy'),
      builderMock.getResult()
    ]);
  });
}
