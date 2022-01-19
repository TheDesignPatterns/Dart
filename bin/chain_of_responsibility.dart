enum Request { A, B, C }

abstract class AbstractHandler {
  void handleRequest(Request request);
}

class HandlerA implements AbstractHandler {
  final AbstractHandler _successor;

  HandlerA(this._successor);

  @override
  void handleRequest(Request request) {
    if (request == Request.A) {
      print('$request handled by $this');
    } else {
      _successor.handleRequest(request);
    }
  }
}

class HandlerB implements AbstractHandler {
  final AbstractHandler _successor;

  HandlerB(this._successor);

  @override
  void handleRequest(Request request) {
    if (request == Request.B) {
      print('$request handled by $this');
    } else {
      _successor.handleRequest(request);
    }
  }
}

class HandlerC implements AbstractHandler {
  @override
  void handleRequest(Request request) => print('$request handled by $this');
}

void main() {
  var handler = HandlerA(HandlerB(HandlerC()));

  handler.handleRequest(Request.C);
  handler.handleRequest(Request.B);
  handler.handleRequest(Request.A);
}
