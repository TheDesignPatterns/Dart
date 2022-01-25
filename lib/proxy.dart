enum Request { foo, bar, baz }
enum Status { handled, notSupported }

abstract class AbstractSubject {
  Status handle(Request request);
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

class RealSubject implements AbstractSubject {
  @override
  Status handle(Request request) => Status.handled;
}
