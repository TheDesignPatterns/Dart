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
  });

  test("verify handle is called for permitted request", () {
    var sut = Proxy(subjectMock, Request.A);

    when(subjectMock.handle(Request.A)).thenReturn(Result.accepted);

    expect(sut.handle(Request.A), Result.accepted);
    verify(subjectMock.handle(Request.A));
  });

  test("verify handle 'proxied' for NOT permitted request", () {
    var sut = Proxy(subjectMock, Request.A);

    expect(sut.handle(Request.B), Result.rejected);
    verifyNever(subjectMock.handle(Request.B));
  });
}
