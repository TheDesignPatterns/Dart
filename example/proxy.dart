import 'package:dp/proxy.dart';

void main() {
  var realSubject = RealSubject();
  var proxy = Proxy(realSubject, notSupported: [Request.bar, Request.baz]);

  // Prints:
  // RealSubject handles Request.foo: Status.handled
  // RealSubject handles Request.bar: Status.handled
  // RealSubject handles Request.baz: Status.handled
  for (var request in [Request.foo, Request.bar, Request.baz]) {
    print('RealSubject handles $request: ${realSubject.handle(request)}');
  }

  // Prints:
  // Proxy handles Request.foo: Status.handled
  // Proxy handles Request.bar: Status.notSupported
  // Proxy handles Request.baz: Status.notSupported
  for (var request in [Request.foo, Request.bar, Request.baz]) {
    print('Proxy handles $request: ${proxy.handle(request)}');
  }
}
