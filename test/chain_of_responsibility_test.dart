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
    for (var request in [Request.A, Request.B, Request.C]) {
      when(handlerMock.handleRequest(request)).thenReturn('resultFromMock');
    }
  });

  group('HandlerA', () {
    test('handles Request.A', () {
      final handler = HandlerA(handlerMock);
      expect(handler.handleRequest(Request.A), handler.toString());
    });

    test('delegates Request.B to successor to get result', () {
      final handler = HandlerA(handlerMock);
      expect(handler.handleRequest(Request.B), 'resultFromMock');
    });

    test('delegates Request.C to successor to get result', () {
      final handler = HandlerA(handlerMock);
      expect(handler.handleRequest(Request.C), 'resultFromMock');
    });
  });

  group('HandlerB', () {
    test('delegates Request.A to successor to get result', () {
      final handler = HandlerB(handlerMock);
      expect(handler.handleRequest(Request.A), 'resultFromMock');
    });

    test('handles Request.B', () {
      final handler = HandlerB(handlerMock);
      expect(handler.handleRequest(Request.B), handler.toString());
    });

    test('delegates Request.C to successor to get result', () {
      final handler = HandlerB(handlerMock);
      expect(handler.handleRequest(Request.C), 'resultFromMock');
    });
  });

  group('HandlerC', () {
    test('recognizes Request.A as unknown', () {
      final handler = HandlerC();
      expect(handler.handleRequest(Request.A), 'Unknown');
    });

    test('recognizes Request.B as unknown', () {
      final handler = HandlerC();
      expect(handler.handleRequest(Request.B), 'Unknown');
    });

    test('handles Request.C', () {
      final handler = HandlerC();
      expect(handler.handleRequest(Request.C), handler.toString());
    });
  });
}
