/// ```dart
/// var realSubject = RealSubject();
/// var proxy = Proxy(realSubject, notSupported: [Request.bar, Request.baz]);
///
/// print(realSubject.handle(Request.foo)); // Prints "Status.handled"
/// print(realSubject.handle(Request.bar)); // Prints "Status.handled"
/// print(realSubject.handle(Request.baz)); // Prints "Status.handled"
///
/// print(proxy.handle(Request.foo)); // Prints "Status.handled"
/// print(proxy.handle(Request.bar)); // Prints "Status.notSupported"
/// print(proxy.handle(Request.baz)); // Prints "Status.notSupported"
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
