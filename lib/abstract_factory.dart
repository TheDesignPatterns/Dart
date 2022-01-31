/// ```dart
/// var factories = [Factory1(), Factory2()];
/// var foos = [for (var f in factories) f.createFoo()];
/// var bars = [for (var f in factories) f.createBar()];
///
/// for (var foo in foos) {
///   print(foo.operation()); // Prints: "Foo1.operation" "Foo2.operation".
/// }
/// for (var bar in bars) {
///   print(bar.operation()); // Prints: "Bar1.operation" "Bar2.operation".
/// }
/// ```

abstract class AbstractFactory {
  AbstractFoo createFoo();
  AbstractBar createBar();
}

class Factory1 implements AbstractFactory {
  @override
  AbstractFoo createFoo() => Foo1();
  @override
  AbstractBar createBar() => Bar1();
}

class Factory2 implements AbstractFactory {
  @override
  AbstractFoo createFoo() => Foo2();
  @override
  AbstractBar createBar() => Bar2();
}

abstract class AbstractFoo {
  String operation();
}

class Foo1 implements AbstractFoo {
  @override
  String operation() => 'Foo1.operation';
}

class Foo2 implements AbstractFoo {
  @override
  String operation() => 'Foo2.operation';
}

abstract class AbstractBar {
  String operation();
}

class Bar1 implements AbstractBar {
  @override
  String operation() => 'Bar1.operation';
}

class Bar2 implements AbstractBar {
  @override
  String operation() => 'Bar2.operation';
}
