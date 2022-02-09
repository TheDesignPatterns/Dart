// SPDX-License-Identifier: MIT
// Copyright (C) 2022 mehoffer <mehoffer@protonmail.com>

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
    for (var request in [Request.foo, Request.bar, Request.baz]) {
      when(handlerMock.handleRequest(request)).thenReturn('Successor');
    }
  });

  group('Foo', () {
    test('handles Request.foo', () {
      final handler = Foo(handlerMock);
      expect(handler.handleRequest(Request.foo), 'Foo handled');
    });

    test('delegates Request.bar to successor', () {
      final handler = Foo(handlerMock);
      expect(handler.handleRequest(Request.bar), 'Successor');
    });

    test('delegates Request.baz to successor', () {
      final handler = Foo(handlerMock);
      expect(handler.handleRequest(Request.baz), 'Successor');
    });
  });

  group('Bar', () {
    test('delegates Request.foo to successor', () {
      final handler = Bar(handlerMock);
      expect(handler.handleRequest(Request.foo), 'Successor');
    });

    test('handles Request.bar', () {
      final handler = Bar(handlerMock);
      expect(handler.handleRequest(Request.bar), 'Bar handled');
    });

    test('delegates Request.baz to successor', () {
      final handler = Bar(handlerMock);
      expect(handler.handleRequest(Request.baz), 'Successor');
    });
  });

  group('Baz', () {
    test('marks Request.foo as unknown', () {
      final handler = Baz();
      expect(handler.handleRequest(Request.foo), 'Unknown');
    });

    test('marks Request.bar as unknown', () {
      final handler = Baz();
      expect(handler.handleRequest(Request.bar), 'Unknown');
    });

    test('handles Request.baz', () {
      final handler = Baz();
      expect(handler.handleRequest(Request.baz), 'Baz handled');
    });
  });
}
