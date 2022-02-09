// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/state.dart';
import 'state_test.mocks.dart';

@GenerateMocks([AbstractState, AbstractContext])
void main() {
  late AbstractState stateFooMock;
  late AbstractState stateBarMock;
  late AbstractContext contextMock;

  setUp(() {
    stateFooMock = MockAbstractState();
    stateBarMock = MockAbstractState();
    contextMock = MockAbstractContext();
  });

  group('When handling request, StateFoo', () {
    test('moves to StateBar', () {
      final stateFoo = StateFoo();
      stateFoo.handle(contextMock);
      verify(contextMock.moveToStateBar());
    });

    test('returns StateFoo.handle', () {
      final stateFoo = StateFoo();
      expect(stateFoo.handle(contextMock), 'StateFoo.handle');
    });
  });

  group('When handling request, StateBar', () {
    test('moves to StateFoo', () {
      final stateBar = StateBar();
      stateBar.handle(contextMock);
      verify(contextMock.moveToStateFoo());
    });

    test('returns StateBar.handle', () {
      final stateBar = StateBar();
      expect(stateBar.handle(contextMock), 'StateBar.handle');
    });
  });

  group('Context delegates handling request to', () {
    test('StateBar after issuing moveToStateBar', () {
      final context = Context(stateFooMock, stateBarMock);
      context.moveToStateBar();
      when(stateBarMock.handle(context)).thenReturn('StateBar.handle');
      expect(context.request(), 'StateBar.handle');
    });

    test('StateFoo after issuing moveToStateFoo', () {
      final context = Context(stateFooMock, stateFooMock);
      context.moveToStateFoo();
      when(stateFooMock.handle(context)).thenReturn('StateFoo.handle');
      expect(context.request(), 'StateFoo.handle');
    });
  });
}
