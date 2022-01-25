import 'package:dart/proxy.dart';

void main() {
  var realSubject = RealSubject();
  var proxy = Proxy(realSubject, notSupported: [Request.Bar, Request.Baz]);

  // Prints:
  // RealSubject handles Request.Foo: Status.handled
  // RealSubject handles Request.Bar: Status.handled
  // RealSubject handles Request.Baz: Status.handled
  for (var request in [Request.Foo, Request.Bar, Request.Baz]) {
    print('RealSubject handles $request: ${realSubject.handle(request)}');
  }

  // Prints:
  // Proxy handles Request.Foo: Status.handled
  // Proxy handles Request.Bar: Status.notSupported
  // Proxy handles Request.Baz: Status.notSupported
  for (var request in [Request.Foo, Request.Bar, Request.Baz]) {
    print('Proxy handles $request: ${proxy.handle(request)}');
  }
}
