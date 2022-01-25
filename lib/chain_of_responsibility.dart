enum Request { foo, bar, baz }

abstract class AbstractHandler {
  String handleRequest(Request request);
}

class Foo implements AbstractHandler {
  final AbstractHandler _successor;

  Foo(this._successor);

  @override
  String handleRequest(Request request) =>
      request == Request.foo ? 'Foo' : _successor.handleRequest(request);
}

class Bar implements AbstractHandler {
  final AbstractHandler _successor;

  Bar(this._successor);

  @override
  String handleRequest(Request request) =>
      request == Request.bar ? 'Bar' : _successor.handleRequest(request);
}

class Baz implements AbstractHandler {
  @override
  String handleRequest(Request request) => 'Baz';
}
