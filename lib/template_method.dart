// SPDX-License-Identifier: MIT
// Copyright (c) 2022 mehoffer <mehoffer@protonmail.com>

/// Usage example:
///
/// ```dart
/// var fooClass = FooClass();
///
/// var result = fooClass.templateMethod();
///
/// print(result); // Prints "[ResultOf.primitiveOperation1, ResultOf.primitiveOperation2]"
/// ```

enum ResultOf { primitiveOperation1, primitiveOperation2 }
typedef Result = List<ResultOf>;

abstract class AbstractClass {
  final Result _result = [];

  Result templateMethod() {
    _primitiveOperation1();
    _primitiveOperation2();
    return _result;
  }

  void _primitiveOperation1();
  void _primitiveOperation2();
}

class FooClass extends AbstractClass {
  @override
  void _primitiveOperation1() => _result.add(ResultOf.primitiveOperation1);

  @override
  void _primitiveOperation2() => _result.add(ResultOf.primitiveOperation2);
}
