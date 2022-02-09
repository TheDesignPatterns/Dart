// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

import 'package:dp/template_method.dart';

void main() {
  var fooClass = FooClass();

  var result = fooClass.templateMethod();

  print(result); // Prints "[ResultOf.primitiveOperation1, ResultOf.primitiveOperation2]"
}
