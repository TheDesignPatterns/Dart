// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/command.dart';

void main() {
  var receiver = Receiver();

  // Commands class (aka Invoker) itself knows nothing about the Receiver.
  var commands = Commands([Foo(receiver), BarBaz(receiver)]);

  print(commands.execute()); // Prints "Receiver.foo, Receiver.bar, Receiver.baz".
}
