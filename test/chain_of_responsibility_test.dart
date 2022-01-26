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
    when(handlerMock.handleRequest(Request.A)).thenReturn('MockA');
    when(handlerMock.handleRequest(Request.B)).thenReturn('MockB');
    when(handlerMock.handleRequest(Request.C)).thenReturn('MockC');
  });

  test('HandlerA returns corresponding name', () {
    final handler = HandlerA(handlerMock);
    expect(handler.handleRequest(Request.A), handler.toString());
    expect(handler.handleRequest(Request.B), 'MockB');
    expect(handler.handleRequest(Request.C), 'MockC');
  });

  test('HandlerB returns corresponding name', () {
    final handler = HandlerB(handlerMock);
    expect(handler.handleRequest(Request.A), 'MockA');
    expect(handler.handleRequest(Request.B), handler.toString());
    expect(handler.handleRequest(Request.C), 'MockC');
  });

  test('HandlerC returns corresponding name', () {
    final handler = HandlerC();
    expect(handler.handleRequest(Request.A), 'Unknown');
    expect(handler.handleRequest(Request.B), 'Unknown');
    expect(handler.handleRequest(Request.C), handler.toString());
  });
}
