import 'package:dp/builder.dart';

void main() {
  var tokens = [Token(Type.A, 'xx'), Token(Type.B, 'yy'), Token(Type.A, 'zz')];

  var foo = Director(FooBuilder()).construct(tokens);
  var bar = Director(BarBuilder()).construct(tokens);

  print(foo); // Prints "[<A>xx</A>, <B>yy</B>, <A>zz</A>]".
  print(bar); // Prints "A=[xx, zz] B=[yy]".
}
