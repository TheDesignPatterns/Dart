// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/composite.dart';

void main() {
  var composite = Foo([Bar(), Foo([Bar(), Bar()])]);

  print(composite.operation()); // Prints "Foo([Bar(), Foo([Bar(), Bar()])])".
}
