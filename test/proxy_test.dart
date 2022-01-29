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

  test('Foo handles all requests', () {
    final foo = Foo();
    expect(foo.handle(Request.bar), Status.handled);
    expect(foo.handle(Request.baz), Status.handled);
  });

  test('Foo proxy does not handle requests intended for rejecting', () {
    final fooProxy = Proxy(fooMock, forRejecting: [Request.baz]);
    expect(fooProxy.handle(Request.bar), Status.handled);
    expect(fooProxy.handle(Request.baz), Status.rejected);
  });
}
