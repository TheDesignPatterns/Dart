enum Request { A, B, C }

abstract class AbstractHandler {
  String handleRequest(Request request);
}

class HandlerA implements AbstractHandler {
  final AbstractHandler _successor;

  HandlerA(this._successor);

  @override
  String handleRequest(Request request) =>
      request == Request.A ? toString() : _successor.handleRequest(request);
}

class HandlerB implements AbstractHandler {
  final AbstractHandler _successor;

  HandlerB(this._successor);

  @override
  String handleRequest(Request request) =>
      request == Request.B ? toString() : _successor.handleRequest(request);
}

class HandlerC implements AbstractHandler {
  @override
  String handleRequest(Request request) =>
      request == Request.C ? toString() : 'Unknown';
}
