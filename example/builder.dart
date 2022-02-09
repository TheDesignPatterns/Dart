// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/builder.dart';

void main() {
  var tokens = [Token(Type.A, 'xx'), Token(Type.B, 'yy'), Token(Type.A, 'zz')];

  var foo = Director(FooBuilder()).construct(tokens);
  var bar = Director(BarBuilder()).construct(tokens);

  print(foo); // Prints "Foo is made of [<A>xx</A>, <B>yy</B>, <A>zz</A>]".
  print(bar); // Prints "Bar is made of A=[xx, zz], B=[yy]".
}
