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

  test('StateFoo moves to StateBar when handling', () {
    final stateFoo = StateFoo();
    expect(stateFoo.handle(contextMock), 'StateFoo.handle');
    verify(contextMock.moveToStateBar());
  });

  test('StateBar moves to StateFoo when handling', () {
    final stateBar = StateBar();
    expect(stateBar.handle(contextMock), 'StateBar.handle');
    verify(contextMock.moveToStateFoo());
  });

  group('Context', () {
    test('delegates handling request to StateFoo by default', () {
      final context = Context(stateFooMock, stateBarMock);
      when(stateFooMock.handle(context)).thenReturn('StateFoo.handle');
      expect(context.request(), 'StateFoo.handle');
    });
    test('delegates handling request to StateBar after issuing moveToStateBar', () {
      final context = Context(stateFooMock, stateBarMock);
      context.moveToStateBar();
      when(stateBarMock.handle(context)).thenReturn('StateBar.handle');
      expect(context.request(), 'StateBar.handle');
    });
    test('delegates handling request to StateFoo after issuing moveToStateFoo', () {
      final context = Context(stateFooMock, stateFooMock);
      context.moveToStateFoo();
      when(stateFooMock.handle(context)).thenReturn('StateFoo.handle');
      expect(context.request(), 'StateFoo.handle');
    });
  });
}
