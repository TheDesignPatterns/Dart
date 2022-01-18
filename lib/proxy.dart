enum Request { A, B }
enum Result { accepted, rejected }

abstract class AbstractSubject {
  Result handle(Request request);
}

class Proxy implements AbstractSubject {
  final AbstractSubject _subject;
  final Request _accepted;

  const Proxy(this._subject, this._accepted);

  @override
  Result handle(Request request) =>
      request == _accepted ? _subject.handle(request) : Result.rejected;
}
