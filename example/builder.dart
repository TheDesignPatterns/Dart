import 'package:dp/builder.dart';

void main() {
  var foo = Director(FooBuilder()).construct();
  var bar = Director(BarBuilder()).construct();

  // Prints "Foo parts: [Color.red, Color.blue][Shape.diamond]".
  print(foo);

  // Prints "Bar parts: [Size.medium][Shape.square, Shape.rectangle]".
  print(bar);
}
