// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>
// All rights reserved. Use of this source code is governed by a
// MIT-style license that can be found in the LICENSE file.

import 'package:dp/chain_of_responsibility.dart';

void main() {
  var chain = Foo(Bar(Baz()));

  print(chain.handleRequest(Request.foo)); // Prints "Foo handled".
  print(chain.handleRequest(Request.bar)); // Prints "Bar handled".
  print(chain.handleRequest(Request.baz)); // Prints "Baz handled".
}
