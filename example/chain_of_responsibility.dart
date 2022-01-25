import 'package:dp/chain_of_responsibility.dart';

void main() {
  var chain = Foo(Bar(Baz()));

  print(chain.handleRequest(Request.foo)); // Prints "Foo".
  print(chain.handleRequest(Request.bar)); // Prints "Bar".
  print(chain.handleRequest(Request.baz)); // Prints "Baz".
}
