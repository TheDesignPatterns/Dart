import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/visitor.dart';
import 'visitor_test.mocks.dart';

@GenerateMocks([AbstractVisitor])
void main() {
  late AbstractVisitor visitorMock;

  setUp(() {
    visitorMock = MockAbstractVisitor();
  });

  group('When accepting a visitor,', () {
    test('Foo element sends visitFoo to that visitor passing itself', () {
      final element = Foo();
      element.accept(visitorMock);
      verify(visitorMock.visitFoo(element));
    });

    test('Bar element sends visitBar to that visitor passing itself', () {
      final element = Bar();
      element.accept(visitorMock);
      verify(visitorMock.visitBar(element));
    });
  });

  group('Visitor1 stores visited element', () {
    test('when receiving visitFoo', () {
      final visitor = Visitor1();
      visitor.visitFoo(Foo());
      expect(visitor.visited, ['Foo']);
    });

    test('when receiving visitBar', () {
      final visitor = Visitor1();
      visitor.visitBar(Bar());
      expect(visitor.visited, ['Bar']);
    });
  });

  group('Visitor2 stores visited element', () {
    test('when receiving visitFoo', () {
      final visitor = Visitor2();
      visitor.visitFoo(Foo());
      expect(visitor.fooVisited, ['Foo']);
    });

    test('when receiving visitBar', () {
      final visitor = Visitor2();
      visitor.visitBar(Bar());
      expect(visitor.barVisited, ['Bar']);
    });
  });
}
