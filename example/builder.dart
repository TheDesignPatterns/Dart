import 'package:dp/builder.dart';

void main() {
  var tokens = [Token(Type.A, 'xxx'), Token(Type.B, 'yyy'), Token(Type.A, 'zzz')];

  var foo = Director(FooBuilder()).construct(tokens);
  var bar = Director(BarBuilder()).construct(tokens);

  print(foo); // Prints "[<A>xxx</A>, <B>yyy</B>, <A>zzz</A>]".
  print(bar); // Prints "A=[xxx, zzz] B=[yyy]".
}
