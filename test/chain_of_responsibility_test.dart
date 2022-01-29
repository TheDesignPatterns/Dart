// Copyright (c) 2022, the Design Patterns project authors.
// All rights reserved. Use of this source code is governed by a
// MIT-style license that can be found in the LICENSE file.

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
      when(handlerMock.handleRequest(request)).thenReturn('Successor');
    }
  });

  group('Foo', () {
    test('handles Request.foo', () {
      final handler = HandlerA(handlerMock);
      expect(handler.handleRequest(Request.A), handler.toString());
    });

    test('delegates Request.bar to successor', () {
      final handler = HandlerA(handlerMock);
      expect(handler.handleRequest(Request.B), 'Successor');
    });

    test('delegates Request.baz to successor', () {
      final handler = HandlerA(handlerMock);
      expect(handler.handleRequest(Request.C), 'Successor');
    });
  });

  group('Bar', () {
    test('delegates Request.A to successor', () {
      final handler = HandlerB(handlerMock);
      expect(handler.handleRequest(Request.A), 'Successor');
    });

    test('handles Request.bar', () {
      final handler = HandlerB(handlerMock);
      expect(handler.handleRequest(Request.B), handler.toString());
    });

    test('delegates Request.baz to successor', () {
      final handler = HandlerB(handlerMock);
      expect(handler.handleRequest(Request.C), 'Successor');
    });
  });

  group('Baz', () {
    test('marks Request.foo as unknown', () {
      final handler = HandlerC();
      expect(handler.handleRequest(Request.A), 'Unknown');
    });

    test('marks Request.bar as unknown', () {
      final handler = HandlerC();
      expect(handler.handleRequest(Request.B), 'Unknown');
    });

    test('handles Request.baz', () {
      final handler = HandlerC();
      expect(handler.handleRequest(Request.C), handler.toString());
    });
  });
}
