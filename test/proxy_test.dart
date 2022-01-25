import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dp/proxy.dart';
import 'proxy_test.mocks.dart';

@GenerateMocks([AbstractSubject])
void main() {
  late AbstractSubject subjectMock;

  setUp(() {
    subjectMock = MockAbstractSubject();
    when(subjectMock.handle(Request.foo)).thenReturn(Status.handled);
    when(subjectMock.handle(Request.bar)).thenReturn(Status.notSupported);
    when(subjectMock.handle(Request.baz)).thenReturn(Status.notSupported);
  });

  test("RealSubject handles all requests", () {
    final subject = RealSubject();
    expect(subject.handle(Request.foo), Status.handled);
    expect(subject.handle(Request.bar), Status.handled);
    expect(subject.handle(Request.baz), Status.handled);
  });

  test("Proxy handles only supported requests", () {
    final proxy = Proxy(subjectMock, notSupported: [Request.bar, Request.baz]);
    expect(proxy.handle(Request.foo), Status.handled);
    expect(proxy.handle(Request.bar), Status.notSupported);
    expect(proxy.handle(Request.baz), Status.notSupported);
  });
}
