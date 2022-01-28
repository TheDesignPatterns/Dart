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

  test("Foo handles all requests", () {
    final foo = Foo();
    expect(foo.handle(Request.bar), Status.handled);
    expect(foo.handle(Request.baz), Status.handled);
  });

  test("Proxy Foo rejects Request.baz", () {
    final proxyFoo = Proxy(fooMock, forRejecting: [Request.baz]);
    expect(proxyFoo.handle(Request.bar), Status.handled);
    expect(proxyFoo.handle(Request.baz), Status.rejected);
  });
}
