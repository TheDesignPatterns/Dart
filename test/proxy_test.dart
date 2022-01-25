import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:dart/proxy.dart';
import 'proxy_test.mocks.dart';

@GenerateMocks([AbstractSubject])
void main() {
  late AbstractSubject subjectMock;

  setUp(() {
    subjectMock = MockAbstractSubject();
    when(subjectMock.handle(Request.Foo)).thenReturn(Status.handled);
    when(subjectMock.handle(Request.Bar)).thenReturn(Status.notSupported);
    when(subjectMock.handle(Request.Baz)).thenReturn(Status.notSupported);
  });

  test("Subject handles all requests", () {
    final subject = RealSubject();
    expect(subject.handle(Request.Foo), Status.handled);
    expect(subject.handle(Request.Bar), Status.handled);
    expect(subject.handle(Request.Baz), Status.handled);
  });

  test("Proxy handles only supported requests", () {
    final proxy = Proxy(subjectMock, notSupported: [Request.Bar, Request.Baz]);
    expect(proxy.handle(Request.Foo), Status.handled);
    expect(proxy.handle(Request.Bar), Status.notSupported);
    expect(proxy.handle(Request.Baz), Status.notSupported);
  });
}
