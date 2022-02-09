// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/facade.dart';

void main() {
  var facade = Facade(SubsystemFactory());

  print(facade.handle()); // Prints "Foo.handle|Bar.handle|Baz.handle".
}
