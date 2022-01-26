import 'package:dp/chain_of_responsibility.dart';

void main() {
  var chain = Foo(Bar(Baz()));

  print(chain.handleRequest(Request.A)); // Prints "Foo handled".
  print(chain.handleRequest(Request.B)); // Prints "Bar handled".
  print(chain.handleRequest(Request.C)); // Prints "Baz handled".
}

class Foo extends HandlerA {
  Foo(AbstractHandler successor) : super(successor);

  @override
  String toString() => 'Foo handled';
}

class Bar extends HandlerB {
  Bar(AbstractHandler successor) : super(successor);

  @override
  String toString() => 'Bar handled';
}

class Baz extends HandlerC {
  @override
  String toString() => 'Baz handled';
}
