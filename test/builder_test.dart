import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/builder.dart';
import 'builder_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<AbstractBuilder<Foo>>()])
void main() {
  late AbstractBuilder builderMock;
  late Foo foo;

  setUp(() {
    builderMock = MockAbstractBuilder();
    foo = Foo();
    when(builderMock.getResult()).thenReturn(foo);
  });

  test('Director constructs Foo by using Builder interface in proper order', () {
    final director = Director(builderMock);
    expect(director.construct(), foo);
    verifyInOrder([
      builderMock.buildPartA(),
      builderMock.buildPartB(),
      builderMock.getResult()
    ]);
  });

  group('FooBuilder builds Foo with', () {
    test('Color.red, Color.blue', () {
      final builder = FooBuilder();
      builder.buildPartA();
      expect(builder.getResult().colors, [Color.red, Color.blue]);
    });

    test('Shape.diamond', () {
      final builder = FooBuilder();
      builder.buildPartB();
      expect(builder.getResult().shapes, [Shape.diamond]);
    });
  });

  group('BarBuilder builds Bar with', () {
    test('Size.medium', () {
      final builder = BarBuilder();
      builder.buildPartA();
      expect(builder.getResult().sizes, [Size.medium]);
    });

    test('Shape.square, Shape.rectangle', () {
      final builder = BarBuilder();
      builder.buildPartB();
      expect(builder.getResult().shapes, [Shape.square, Shape.rectangle]);
    });
  });
}
