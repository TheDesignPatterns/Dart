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
