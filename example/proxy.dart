import 'package:dp/proxy.dart';

void main() {
  var foo = Foo();
  var fooProxy = Proxy(foo, forRejecting: [Request.baz]);

  print(foo.handle(Request.bar)); // Prints "Status.handled".
  print(foo.handle(Request.baz)); // Prints "Status.handled".

  print(fooProxy.handle(Request.bar)); // Prints "Status.handled".
  print(fooProxy.handle(Request.baz)); // Prints "Status.rejected".
}
