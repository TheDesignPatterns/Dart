/// ```dart
/// var foo = Foo();
/// var proxyFoo = Proxy(foo, rejected: [Request.baz]);
///
/// print(foo.handle(Request.bar)); // Prints "Status.handled"
/// print(foo.handle(Request.baz)); // Prints "Status.handled"
///
/// print(proxyFoo.handle(Request.bar)); // Prints "Status.handled"
/// print(proxyFoo.handle(Request.baz)); // Prints "Status.rejected"
/// ```

enum Request { foo, bar, baz }
enum Status { handled, notSupported }

abstract class AbstractSubject {
  Status handle(Request request);
}

class RealSubject implements AbstractSubject {
  @override
  Status handle(Request request) => Status.handled;
}

class Proxy implements AbstractSubject {
  final AbstractSubject _subject;
  final List<Request> _notSupported;

  Proxy(this._subject, {required List<Request> notSupported})
      : _notSupported = notSupported;

  @override
  Status handle(Request request) => _notSupported.contains(request)
      ? Status.notSupported
      : _subject.handle(request);
}
