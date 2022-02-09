// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/strategy.dart';

void main() {
  var contextWithFooStrategy = Context(FooStrategy());
  var contextWithBarStrategy = Context(BarStrategy());

  print(contextWithFooStrategy.operation()); // Prints "FooStrategy.algorithm".
  print(contextWithBarStrategy.operation()); // Prints "BarStrategy.algorithm".
}
