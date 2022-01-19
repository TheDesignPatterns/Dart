import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../bin/chain_of_responsibility.dart';
import 'chain_of_responsibility_test.mocks.dart';

@GenerateMocks([AbstractHandler])
void main() {
  late AbstractHandler handlerMock;

  setUp(() {
    handlerMock = MockAbstractHandler();
  });

  test('handle is called on successor', () {
    var sut = HandlerA(handlerMock);

    sut.handleRequest(Request.B);
    verify(handlerMock.handleRequest(Request.B));
  });

  test('handle is called on successor', () {
    var sut = HandlerA(HandlerB(handlerMock));

    sut.handleRequest(Request.C);
    verify(handlerMock.handleRequest(Request.C));
  });

  test('handle is called on successor', () {
    var sut = HandlerB(handlerMock);

    sut.handleRequest(Request.C);
    verify(handlerMock.handleRequest(Request.C));
  });
}
