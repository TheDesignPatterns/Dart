import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/proxy.dart';
import 'proxy_test.mocks.dart';

@GenerateMocks([AbstractSubject])
void main() {
  late AbstractSubject fooMock;

  setUp(() {
    fooMock = MockAbstractSubject();
    when(fooMock.handle(Request.bar)).thenReturn(Status.handled);
  });

  group('Foo handles', () {
    test('Request.bar', () {
      final foo = Foo();
      expect(foo.handle(Request.bar), Status.handled);
    });

    test('Request.baz', () {
      final foo = Foo();
      expect(foo.handle(Request.baz), Status.handled);
    });
  });

  group('Foo proxy', () {
    test('handles Request.bar', () {
      final fooProxy = Proxy(fooMock, forRejecting: [Request.baz]);
      expect(fooProxy.handle(Request.bar), Status.handled);
    });

    test('rejects Request.baz', () {
      final fooProxy = Proxy(fooMock, forRejecting: [Request.baz]);
      expect(fooProxy.handle(Request.baz), Status.rejected);
    });
  });
}
