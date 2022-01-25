import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/chain_of_responsibility.dart';
import 'chain_of_responsibility_test.mocks.dart';

@GenerateMocks([AbstractHandler])
void main() {
  late AbstractHandler handlerMock;

  setUp(() {
    handlerMock = MockAbstractHandler();
    when(handlerMock.handleRequest(Request.foo)).thenReturn('Foo');
    when(handlerMock.handleRequest(Request.bar)).thenReturn('Bar');
    when(handlerMock.handleRequest(Request.baz)).thenReturn('Baz');
  });

  test('Foo handler returns corresponding name', () {
    final handler = Foo(handlerMock);
    expect(handler.handleRequest(Request.foo), 'Foo');
    expect(handler.handleRequest(Request.bar), 'Bar');
    expect(handler.handleRequest(Request.baz), 'Baz');
  });

  test('Bar handler returns corresponding name', () {
    final handler = Bar(handlerMock);
    expect(handler.handleRequest(Request.foo), 'Foo');
    expect(handler.handleRequest(Request.bar), 'Bar');
    expect(handler.handleRequest(Request.baz), 'Baz');
  });

  test('Baz handler returns "Baz"', () {
    final handler = Baz();
    expect(handler.handleRequest(Request.foo), 'Baz');
    expect(handler.handleRequest(Request.bar), 'Baz');
    expect(handler.handleRequest(Request.baz), 'Baz');
  });
}
