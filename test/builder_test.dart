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
    when(builderMock.getResult()).thenReturn('product');
  });

  test('Director constructs a product using Builder interface', () {
    final director = Director(builderMock);
    director.construct([Token(Type.A, 'xx'), Token(Type.B, 'yy')]);
    verifyInOrder([
      builderMock.buildPartA('xx'),
      builderMock.buildPartB('yy'),
      builderMock.getResult()
    ]);
  });

  test('FooBuilder builds Foo', () {
    final builder = FooBuilder();
    builder.buildPartA('xx');
    builder.buildPartB('yy');
    var foo = builder.getResult();
    expect(foo.toString(), ['<A>xx</A>', '<B>yy</B>'].toString());
  });

  test('BarBuilder builds Bar', () {
    final builder = BarBuilder();
    builder.buildPartA('xx');
    builder.buildPartB('yy');
    var bar = builder.getResult();
    expect(bar.toString(), 'A=[xx], B=[yy]');
  });
}
