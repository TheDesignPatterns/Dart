import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/mediator.dart';
import 'mediator_test.mocks.dart';

@GenerateMocks([AbstractMediator])
void main() {
  late AbstractMediator mediatorMock;

  setUp(() {
    mediatorMock = MockAbstractMediator();
  });

  test('Mediator knows the colleague', () {
    final colleague = Colleague(mediatorMock);
    verify(mediatorMock.add(colleague));
  });

  test('Colleague takes part in mediation', () {
    final colleague = Colleague(mediatorMock);
    colleague.handleRequest();
    verify(mediatorMock.mediate(colleague));
  });
}
