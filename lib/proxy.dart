/// ```dart
/// var foo = Foo();
/// var proxyFoo = Proxy(foo, forRejecting: [Request.baz]);
///
/// print(foo.handle(Request.bar)); // Prints "Status.handled"
/// print(foo.handle(Request.baz)); // Prints "Status.handled"
///
/// print(proxyFoo.handle(Request.bar)); // Prints "Status.handled"
/// print(proxyFoo.handle(Request.baz)); // Prints "Status.rejected"
/// ```

enum Request { bar, baz }
enum Status { handled, rejected }

abstract class AbstractSubject {
  Status handle(Request request);
}

class Foo implements AbstractSubject {
  @override
  Status handle(Request request) => Status.handled;
}

class Proxy implements AbstractSubject {
  final AbstractSubject _subject;
  final List<Request> _forRejecting;

  Proxy(this._subject, {required List<Request> forRejecting})
      : _forRejecting = forRejecting;

  @override
  Status handle(Request request) => _forRejecting.contains(request)
      ? Status.rejected
      : _subject.handle(request);
}
